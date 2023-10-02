import 'package:book_store/Core/Component/toast.dart';
import 'package:book_store/Features/Add%20to%20cart/ViewModel/Add%20to%20cart%20Cubit/add_to_caet_cubit.dart';
import 'package:book_store/Features/AddToWishlist/ViewModel/Add%20To%20Wish%20List%20Cubit/add_to_wish_list_cubit.dart';
import 'package:book_store/Features/Home%20Screen/View/Pages/home_screen.dart';
import 'package:book_store/Features/Home%20Tab/View/Pages/home_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Auth/ViewModel/Login/login_cubit.dart';

class BookDetails extends StatelessWidget {
  static const String routeName = "book_details";

  BookDetails({super.key});
  AddToCartCubit addToCartCubit = AddToCartCubit();
  AddToWishListCubit addToWishListCubit = AddToWishListCubit();
  Color favoriteIcon = Colors.grey;
  @override
  Widget build(BuildContext context) {
    Argument argument = ModalRoute.of(context)!.settings.arguments as Argument;

    return Scaffold(
      appBar: AppBar(
        actions: [
          buildBlocConsumerAddToWishListButton(
                  () {
                addToWishListCubit.addToWishList(
                    argument.bestSellerResponse
                    ?.data?.products?[argument.index].id ??
                    argument.newArrivalResponse?.data
                        ?.products?[argument.index].id ??
                    argument.productsResponse?.data
                        ?.products?[argument.index].id ??
                    argument.searchResponse?.data
                        ?.products?[argument.index].id ??
                    -1);
              }
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: argument.bestSellerResponse?.data
                          ?.products?[argument.index].image ??
                      argument.newArrivalResponse?.data
                          ?.products?[argument.index].image ??
                      argument.productsResponse?.data?.products?[argument.index]
                          .image ??
                      argument.searchResponse?.data?.products?[argument.index]
                          .image ??
                      '',
                  placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: 260,
                      child: Shimmer.fromColors(
                        baseColor: const Color(0xff56528c),
                        highlightColor: const Color(0xff8ee6f1),
                        child: Container(
                          color: Colors.grey,
                        ),
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                argument.bestSellerResponse?.data?.products?[argument.index]
                        .name ??
                    argument.newArrivalResponse?.data?.products?[argument.index]
                        .name ??
                    argument.productsResponse?.data?.products?[argument.index]
                        .name ??
                    argument
                        .searchResponse?.data?.products?[argument.index].name ??
                    '',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    argument.bestSellerResponse?.data?.products?[argument.index]
                            .category ??
                        argument.newArrivalResponse?.data
                            ?.products?[argument.index].category ??
                        argument.productsResponse?.data
                            ?.products?[argument.index].category ??
                        argument.searchResponse?.data?.products?[argument.index]
                            .category ??
                        '',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        argument.bestSellerResponse?.data
                                ?.products?[argument.index].price ??
                            argument.newArrivalResponse?.data
                                ?.products?[argument.index].price ??
                            argument.productsResponse?.data
                                ?.products?[argument.index].price ??
                            argument.searchResponse?.data
                                ?.products?[argument.index].price ??
                            '',
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            decorationColor: Colors.grey),
                      ),
                      Text(
                        '${argument.bestSellerResponse?.data?.products?[argument.index].priceAfterDiscount ?? argument.newArrivalResponse?.data?.products?[argument.index].priceAfterDiscount ?? argument.productsResponse?.data?.products?[argument.index].priceAfterDiscount ?? argument.searchResponse?.data?.products?[argument.index].priceAfterDiscount}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                argument.bestSellerResponse?.data?.products?[argument.index]
                        .description ??
                    argument.newArrivalResponse?.data?.products?[argument.index]
                        .description ??
                    argument.productsResponse?.data?.products?[argument.index]
                        .description ??
                    argument.searchResponse?.data?.products?[argument.index]
                        .description ??
                    '',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildBlocConsumerAddToCartButton(
                      () {
                  addToCartCubit.addToCart(argument.bestSellerResponse
                      ?.data?.products?[argument.index].id ??
                      argument.newArrivalResponse?.data
                          ?.products?[argument.index].id ??
                      argument.productsResponse?.data
                          ?.products?[argument.index].id ??
                      argument.searchResponse?.data
                          ?.products?[argument.index].id ??
                      -1);
                }
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBlocConsumerAddToCartButton(Function() onTab) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      bloc: addToCartCubit,
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          buildShowToast(state.addToCartResponse.message??'');
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        }
        if (state is AddToCartError) {
          buildShowToast(state.message);
        }
      },
      builder: (context, state) {
        if (state is AddToCartLoading) {
          return Center(child: const CircularProgressIndicator());
        }
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTab,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 23),
            ),
          ),
        ),
      );
      },
    );
  }
  Widget buildBlocConsumerAddToWishListButton(Function() onTab) {
    return BlocConsumer<AddToWishListCubit, AddToWishListState>(
      bloc: addToWishListCubit,
      listener: (context, state) {
        if (state is AddToWishListSuccess) {
          favoriteIcon = Colors.red;
          buildShowToast(state.addToWishList.message??'');

        }
        if (state is AddToWishListError) {
          buildShowToast(state.message);
        }
      },
      builder: (context, state) {
        if (state is AddToWishListLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        return IconButton(
            onPressed: onTab,
            icon:  Icon(Icons.favorite,color: favoriteIcon,))
        ;
      },
    );
  }

}
