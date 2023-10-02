import 'package:book_store/Features/Add%20to%20cart/Model/Remove%20From%20Cart/RemoveFromCart.dart';
import 'package:book_store/Features/Cart%20Tab/ViewModel/Show%20Cart/show_cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/Component/toast.dart';
import '../../ViewModel/Show Wishlist/show_all_wishlist_cubit.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});
  ShowAllWishlistCubit showAllWishlistCubit = ShowAllWishlistCubit();
 // RemoveFromCartCubit removeFromCartCubit = RemoveFromCartCubit();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocProvider(
          create: (context) => ShowAllWishlistCubit()..showWishlist(),
          child: BlocConsumer<ShowAllWishlistCubit, ShowAllWishlistState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ShowAllWishlistLoading) {
                return CircularProgressIndicator();
              } else if (state is ShowAllWishlistError) {
                return Text(state.errorMessage);
              } else if (state is ShowAllWishlistSuccess) {
                if(state.showWishlistResponse.data?.productData?.length == 0){
                  return Center(child: Text('There is no item to show'));
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)

                              ),
                              child: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width * .3,
                                height: MediaQuery.of(context).size.height * .2,
                                fit: BoxFit.fill,
                                imageUrl: state.showWishlistResponse.data?.productData?[index].image??
                                    '',
                                placeholder: (context, url) => SizedBox(
                                    child: Shimmer.fromColors(
                                      baseColor: const Color(0xff56528c),
                                      highlightColor: const Color(0xff8ee6f1),
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    )),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.showWishlistResponse.data?.productData?[index].name ??
                                      '',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,

                                  ),maxLines: 3,overflow: TextOverflow.ellipsis),
                                  Text('data')
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(height:MediaQuery.of(context).size.height * .1,),
                                Text('${
                                    state.showWishlistResponse.data?.productData?[index].price
                                }' ??
                                    '')
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemCount:
                    state.showWishlistResponse.data?.productData?.length ?? 0);
              }
              return SizedBox();
            },
          ),
        ));




  }
  //
  // Widget buildBlocConsumerRemoveFromCartButton(Function() onTab) {
  //   return BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
  //     bloc: removeFromCartCubit,
  //     listener: (context, state) {
  //       if (state is RemoveFromCartSuccess) {
  //         buildShowToast('Removed Successfully');
  //       }
  //       if (state is RemoveFromCartError) {
  //         buildShowToast(state.message);
  //       }
  //     },
  //     builder: (context, state) {
  //       if (state is RemoveFromCartLoading) {
  //         return Center(child: const CircularProgressIndicator());
  //       }
  //       return IconButton(
  //           onPressed: onTab,
  //           icon:  Icon(Icons.delete,color: Colors.red,))
  //       ;
  //     },
  //   );
  // }

}
