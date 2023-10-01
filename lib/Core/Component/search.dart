
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../Features/Book Details Screen/View/Pages/movie_details.dart';
import '../../Features/Books Tab/ViewModel/SearchViewModel/search_cubit.dart';
import '../../Features/Home Tab/View/Pages/home_tab.dart';

class SearchProduct extends StatelessWidget {
  SearchProduct({super.key});
  static const String routeName = "search";
  final TextEditingController searchController = TextEditingController();
  SearchCubit searchCubit = SearchCubit();
  @override
  Widget build(BuildContext context) {
    //var cupit = SearchCubit.get(context);
    //searchCubit.search(keyWord: 'z');
    return Scaffold(
      appBar: AppBar(
        title:  TextField(
          controller: searchController,
          onChanged: (text) {
            searchCubit.search(keyWord: text);

          },
          onSubmitted: (value) {
            searchCubit.search(keyWord: value);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<SearchCubit, SearchState>(
          bloc: searchCubit,
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is SearchInitial){
              return Center(child: Text('Enter a search word'));
            }
            if (state is SearchLoading){
              return CircularProgressIndicator();
            }
            if(state is SearchError){
              return Text(state.message);
            }
            if(state is SearchSuccess){
              if(state.searchResponse.data?.products?.length ==0){
                return Text('There is no Item to show');
              }

              return ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,BookDetails.routeName,
                            arguments: Argument(index: index,
                                searchResponse: state.searchResponse)
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                height: 150,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: state.searchResponse.data?.products?[index].image??'',
                                  placeholder: (context, url) =>
                                      SizedBox(
                                          width: double.infinity,
                                          height: 260,
                                          child: Shimmer.fromColors(
                                            baseColor: const Color(0xff56528c),
                                            highlightColor: const Color(0xff8ee6f1),
                                            child: Container(color: Colors.grey,),)),


                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ), SizedBox(
                                width: MediaQuery.of(context).size.width*.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.searchResponse.data?.products?[index].name??'',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text(state.searchResponse.data?.products?[index].category??''),
                                    Text('${
                                        state.searchResponse.data?.products?[index]
                                            .priceAfterDiscount
                                    }'),
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
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.searchResponse.data?.products?.length??0);
            }
            return Container();

          },
        ),
      ),
    );
  }
}




// import 'package:book_store/Features/Books%20Tab/ViewModel/SearchViewModel/search_cubit.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../Api Manager/api_manager.dart';
//
// class ProductSearch extends SearchDelegate {
//   ProductSearch({
//     String hintText = "Search",
//   }) : super(
//     searchFieldLabel: hintText,searchFieldStyle: TextStyle(
//     color: Colors.green,
//   ),
//     keyboardType: TextInputType.text,
//     textInputAction: TextInputAction.search,
//   );
//
//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       scaffoldBackgroundColor: Colors.white,
//       backgroundColor: Colors.white,
//       inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(50)),
//           focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(50)),
//           hintStyle: TextStyle(
//               color: Colors.green
//           )
//       ),
//
//       appBarTheme:const AppBarTheme(
//           iconTheme: IconThemeData(
//               color: Colors.white,
//               size: 35
//           ),
//
//           color: Colors.green,
//           centerTitle: true,
//           toolbarHeight: 80,
//
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(40),
//                 bottomRight: Radius.circular(40),
//               )
//           )
//       ),hintColor: Colors.green,
//     );
//   }
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(onPressed: (){
//         showResults(context);
//       },
//           icon: Icon(Icons.search))
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(Icons.clear)
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return  Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: ClipRRect(
//           //borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top:  Radius.circular(20)),
//           child: BlocBuilder<SearchCubit,SearchState>(
//               bloc: SearchCubit().search(keyWord: query),
//               builder: (context, state) {
//                 if (state is SearchLoading) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (state is SearchError) {
//                   return Center(
//                     child: Column(
//                       children: [
//                         Text(state.message.toString()),
//                         ElevatedButton(
//                             onPressed: () {
//                               showResults(context);
//                             },
//                             child: Text('Try Again'))
//                       ],
//                     ),
//                   );
//                 }
//                 if (state is SearchSuccess) {
//                   return Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//                       child: ListView.builder(
//                         itemBuilder: (context, index) {
//                           return  Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.black, width: 1),
//                                 borderRadius: BorderRadius.all(Radius.circular(25))
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     width: 120,
//                                     height: 150,
//                                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                                     decoration: const BoxDecoration(
//                                         color: Colors.blue,
//                                         borderRadius: BorderRadius.all(Radius.circular(25))
//                                     ),
//                                     child: CachedNetworkImage(
//                                       fit: BoxFit.fill,
//                                       imageUrl: state.searchResponse.data?.products?[index].image??'',
//                                       placeholder: (context, url) =>
//                                           SizedBox(
//                                               width: double.infinity,
//                                               height: 260,
//                                               child: Shimmer.fromColors(
//                                                 baseColor: const Color(0xff56528c),
//                                                 highlightColor: const Color(0xff8ee6f1),
//                                                 child: Container(color: Colors.grey,),)),
//
//
//                                       errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                     ),
//                                   ), SizedBox(
//                                     width: MediaQuery.of(context).size.width*.5,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(state.searchResponse.data?.products?[index].name??''),
//                                         Text(state.searchResponse.data?.products?[index].category??''),
//                                         Text('${
//                                             state.searchResponse.data?.products?[index]
//                                                 .priceAfterDiscount
//                                         }'),
//                                       ],
//                                     ),
//                                   ),
//                                   Column(
//                                     children: [
//                                       IconButton(
//                                           onPressed: () {},
//                                           icon: Icon(Icons.favorite)),
//                                       IconButton(
//                                           onPressed: () {},
//                                           icon: Icon(Icons.shopping_cart))
//                                     ],
//                                   )
//
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         itemCount: state.searchResponse.data?.products?.length??0,
//
//                       ),
//                     ),
//                   );
//                 }
//
//                 return Container();
//               }
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
//   //
//   // @override
//   // Widget buildSuggestions(BuildContext context) {
//   //   //return Text('');
//   //   if(query.isEmpty){
//   //     return Center(child: Text('Please Enter Search Word'));
//   //   }else {
//   //     return Expanded(
//   //       child: Padding(
//   //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//   //         child: ClipRRect(
//   //           //borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top:  Radius.circular(20)),
//   //           child: BlocBuilder<SearchCubit,SearchState>(
//   //             bloc: SearchCubit().search(keyWord: query),
//   //               builder: (context, state) {
//   //                 if (state is SearchLoading) {
//   //                   return Center(child: CircularProgressIndicator());
//   //                 }
//   //                 if (state is SearchError) {
//   //                   return Center(
//   //                     child: Column(
//   //                       children: [
//   //                         Text(state.message.toString()),
//   //                         ElevatedButton(
//   //                             onPressed: () {
//   //                               showResults(context);
//   //                             },
//   //                             child: Text('Try Again'))
//   //                       ],
//   //                     ),
//   //                   );
//   //                 }
//   //                 if (state is SearchSuccess) {
//   //                   return Expanded(
//   //                     child: Padding(
//   //                       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//   //                       child: ListView.builder(
//   //                         itemBuilder: (context, index) {
//   //                           return  Container(
//   //                             decoration: BoxDecoration(
//   //                                 border: Border.all(color: Colors.black, width: 1),
//   //                                 borderRadius: BorderRadius.all(Radius.circular(25))
//   //                             ),
//   //                             child: Padding(
//   //                               padding: const EdgeInsets.all(8.0),
//   //                               child: Row(
//   //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                                 children: [
//   //                                   Container(
//   //                                     width: 120,
//   //                                     height: 150,
//   //                                     clipBehavior: Clip.antiAliasWithSaveLayer,
//   //                                     decoration: const BoxDecoration(
//   //                                         color: Colors.blue,
//   //                                         borderRadius: BorderRadius.all(Radius.circular(25))
//   //                                     ),
//   //                                     child: CachedNetworkImage(
//   //                                       fit: BoxFit.fill,
//   //                                       imageUrl: state.searchResponse.data?.products?[index].image??'',
//   //                                       placeholder: (context, url) =>
//   //                                           SizedBox(
//   //                                               width: double.infinity,
//   //                                               height: 260,
//   //                                               child: Shimmer.fromColors(
//   //                                                 baseColor: const Color(0xff56528c),
//   //                                                 highlightColor: const Color(0xff8ee6f1),
//   //                                                 child: Container(color: Colors.grey,),)),
//   //
//   //
//   //                                       errorWidget: (context, url, error) =>
//   //                                       const Icon(Icons.error),
//   //                                     ),
//   //                                   ), SizedBox(
//   //                                     width: MediaQuery.of(context).size.width*.5,
//   //                                     child: Column(
//   //                                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                                       children: [
//   //                                         Text(state.searchResponse.data?.products?[index].name??''),
//   //                                         Text(state.searchResponse.data?.products?[index].category??''),
//   //                                         Text('${
//   //                                             state.searchResponse.data?.products?[index]
//   //                                                 .priceAfterDiscount
//   //                                         }'),
//   //                                       ],
//   //                                     ),
//   //                                   ),
//   //                                   Column(
//   //                                     children: [
//   //                                       IconButton(
//   //                                           onPressed: () {},
//   //                                           icon: Icon(Icons.favorite)),
//   //                                       IconButton(
//   //                                           onPressed: () {},
//   //                                           icon: Icon(Icons.shopping_cart))
//   //                                     ],
//   //                                   )
//   //
//   //                                 ],
//   //                               ),
//   //                             ),
//   //                           );
//   //                         },
//   //                         itemCount: state.searchResponse.data?.products?.length??0,
//   //
//   //                       ),
//   //                     ),
//   //                   );
//   //                 }
//   //
//   //                 return Container();
//   //               }
//   //
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }
//   // }
//
//
// }