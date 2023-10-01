

import 'package:book_store/Features/Home%20Tab/View/Pages/home_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Auth/ViewModel/Login/login_cubit.dart';

class BookDetails extends StatelessWidget {
  static const String routeName = "book_details";

  const BookDetails({super.key});


  @override
  Widget build(BuildContext context) {
    Argument argument = ModalRoute.of(context)!.settings.arguments as Argument;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite))
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
                  imageUrl: argument.bestSellerResponse?.data?.products?[argument.index].image??
                      argument.newArrivalResponse?.data?.products?[argument.index].image??
                      argument.productsResponse?.data?.products?[argument.index].image??
                      argument.searchResponse?.data?.products?[argument.index].image??

                      '',
                  placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: 260,
                      child: Shimmer.fromColors(
                        baseColor: const Color(0xff56528c),
                        highlightColor: const Color(0xff8ee6f1),
                        child: Container(color: Colors.grey,),)),


                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 20,),
              Text(argument.bestSellerResponse?.data?.products?[argument.index].name ??
                  argument.newArrivalResponse?.data?.products?[argument.index].name??
                  argument.productsResponse?.data?.products?[argument.index].name??
                  argument.searchResponse?.data?.products?[argument.index].name??

                  '',
                style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(argument.bestSellerResponse?.data?.products?[argument.index].category??
                      argument.newArrivalResponse?.data?.products?[argument.index].category??
                      argument.productsResponse?.data?.products?[argument.index].category??
                      argument.searchResponse?.data?.products?[argument.index].category??

                      '',
                    style: const TextStyle(
                      fontSize: 20,

                  ),),
                  Column(
                    children: [
                      Text(argument.bestSellerResponse?.data?.products?[argument.index].price??
                          argument.newArrivalResponse?.data?.products?[argument.index].price??
                          argument.productsResponse?.data?.products?[argument.index].price??
                          argument.searchResponse?.data?.products?[argument.index].price??

                          '',
                        style: const TextStyle(
                        fontSize: 20,
                          decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        decorationColor: Colors.grey

                      ),),
                      Text(
                        '${
                          argument.bestSellerResponse?.data
                              ?.products?[argument.index].priceAfterDiscount??
                              argument.newArrivalResponse?.data?.products?[argument.index].priceAfterDiscount??
                              argument.productsResponse?.data?.products?[argument.index].priceAfterDiscount??
                              argument.searchResponse?.data?.products?[argument.index].priceAfterDiscount

                        }',
                        style: const TextStyle(
                        fontSize: 20,
                      ),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              const Text('Description',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 8,),
               Text(argument.bestSellerResponse?.data?.products?[argument.index].description??
                   argument.newArrivalResponse?.data?.products?[argument.index].description??
                   argument.productsResponse?.data?.products?[argument.index].description??
                   argument.searchResponse?.data?.products?[argument.index].description??
                   '',
                style: const TextStyle(
                  fontSize: 20,

              ),),
              const SizedBox(height: 10,),
              SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  print(LoginCubit.userModel.data?.token);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add to Cart',
                  style: TextStyle(
                    fontSize: 23
                  ),
                  ),
                ),
              ),),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
