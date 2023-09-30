import 'package:book_store/Features/Home%20Tab/ViewModel/Categories/all_categories_cubit.dart';
import 'package:book_store/Features/Home%20Tab/ViewModel/New%20Arrival/new_arrival_cubit.dart';
import 'package:book_store/Features/Home%20Tab/ViewModel/SliderCubit/slider_cubit.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Component/book_item.dart';
import '../../../../Core/Component/slider.dart';
import '../../ViewModel/Best Seller/best_seller_cubit.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocProvider(
            create: (context) =>
            SliderCubit()
              ..getSlider(),
            child: BlocConsumer<SliderCubit, SliderState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SliderLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (state is SliderError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                else if (state is SliderSuccess) {
                  return SizedBox(
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: state.sliderResponse.data?.sliders?.length ?? 0,
                      itemBuilder: (context, index,
                          int pageViewIndex) {
                        return InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context,
                              //     MovieDetailsScreen.routeName,
                              //     arguments: Arggs(
                              //         index: index,
                              //         topRatedDetails: data,
                              //         id: data?[index].id
                              //     )
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: HomeSlider(
                                imageUrl: state.sliderResponse.data
                                    ?.sliders?[index].image,

                              ),
                            )
                        );
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          initialPage: 0
                      ),

                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Best Seller',
                  style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All',
                    style: TextStyle(

                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ),
                  ),)
              ],
            ),
          ),
          BlocProvider(
            create: (context) =>
            BestSellerCubit()
              ..bestSeller(),
            child: BlocConsumer<BestSellerCubit, BestSellerState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is BestSellerLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (state is BestSellerError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                else if (state is BestSellerSuccess) {
                  return SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.bestSellerResponse.data?.products
                          ?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context,
                            //     MovieDetailsScreen.routeName,
                            //     arguments: Arggs(
                            //         index: index,
                            //         nowPlayingDetails: data,
                            //         id: data[index].id
                            //
                            //     )
                            // );
                          },
                          child:
                          Container(
                            padding: EdgeInsets.all(2),
                            child: BookItem(
                              imageUrl: state.bestSellerResponse.data
                                  ?.products?[index].image,
                              name: state.bestSellerResponse.data
                                  ?.products?[index].name,
                              price: state.bestSellerResponse.data
                                  ?.products?[index].price,
                            ),
                          ),

                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10,);
                    },

                    ),
                  );
                }
                else {
                  return Container();
                }
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Categories',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All',
                    style: TextStyle(

                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ),
                  ),)
              ],
            ),
          ),

          BlocProvider(
            create: (context) =>
            AllCategoriesCubit()
              ..allCategories(),
            child: BlocConsumer<AllCategoriesCubit, AllCategoriesState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                if(state is AllCategoriesLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(state is AllCategoriesError){
                  return Center(
                    child: Text(state.message),
                  );
                }
                else if(state is AllCategoriesSuccess){
                  return SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ListView.separated(
                      itemCount: state.allCategoriesResponse.data?.categories?.length??0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text(state.allCategoriesResponse.data?.categories?[index].name??'',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10,),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('New Arrival',
                  style: TextStyle(

                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All',
                    style: TextStyle(

                      fontSize: 17,
                      // fontWeight: FontWeight.bold
                    ),
                  ),)
              ],
            ),
          ),
          BlocProvider(
            create: (context) => NewArrivalCubit()..newArrival(),
            child: BlocConsumer<NewArrivalCubit, NewArrivalState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is NewArrivalLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (state is NewArrivalError) {
                  return Center(
                    child: Text(state.message??''),
                  );
                }
                else if (state is NewArrivalSuccess) {
                  return SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.newArrivalResponse.data?.products
                          ?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context,
                            //     MovieDetailsScreen.routeName,
                            //     arguments: Arggs(
                            //         index: index,
                            //         nowPlayingDetails: data,
                            //         id: data[index].id
                            //
                            //     )
                            // );
                          },
                          child:
                          Container(
                            padding: EdgeInsets.all(2),
                            child: BookItem(
                              imageUrl: state.newArrivalResponse.data
                                  ?.products?[index].image,
                              name: state.newArrivalResponse.data
                                  ?.products?[index].name,
                              price: state.newArrivalResponse.data
                                  ?.products?[index].price,
                            ),
                          ),

                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10,);
                    },

                    ),
                  );
                }
                else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
