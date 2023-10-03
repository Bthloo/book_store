import 'package:book_store/Core/Component/search.dart';
import 'package:book_store/Features/Books%20Tab/ViewModel/products_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Book Details Screen/View/Pages/book_details.dart';
import '../../../Home Tab/View/Pages/home_tab.dart';

class BooksTab extends StatelessWidget {
  const BooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..product(page: 1),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return CircularProgressIndicator();
          } else if (state is ProductsError) {
            return Text(state.errorMessage);
          } else if (state is ProductsSuccess) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        Navigator.pushNamed(context, SearchProduct.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Row(
                          children: [Icon(Icons.search), Text('Search...')],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BookDetails.routeName,
                                    arguments: Argument(
                                        index: index,
                                        productsResponse:
                                            state.productsResponse));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 150,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: state.productsResponse.data
                                                  ?.products?[index].image ??
                                              '',
                                          placeholder: (context, url) =>
                                              SizedBox(
                                                  width: double.infinity,
                                                  height: 260,
                                                  child: Shimmer.fromColors(
                                                    baseColor:
                                                        const Color(0xff56528c),
                                                    highlightColor:
                                                        const Color(0xff8ee6f1),
                                                    child: Container(
                                                      color: Colors.grey,
                                                    ),
                                                  )),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(state.productsResponse.data
                                                    ?.products?[index].name ??
                                                ''),
                                            Text(state
                                                    .productsResponse
                                                    .data
                                                    ?.products?[index]
                                                    .category ??
                                                ''),
                                            Text(
                                                '${state.productsResponse.data?.products?[index].priceAfterDiscount}'),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.favorite)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.shopping_cart))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
