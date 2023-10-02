import 'package:book_store/Features/Add%20to%20cart/Model/Remove%20From%20Cart/RemoveFromCart.dart';
import 'package:book_store/Features/Cart%20Tab/ViewModel/Show%20Cart/show_cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/Component/toast.dart';
import '../../../Check out Screem/View/Pages/checkout_screen.dart';
import '../../ViewModel/Remove From Cart/remove_from_cart_cubit.dart';

class CartTab extends StatelessWidget {
  CartTab({super.key});
  ShowCartCubit showCartCubit = ShowCartCubit();
  RemoveFromCartCubit removeFromCartCubit = RemoveFromCartCubit();
  String? totalPrice = '0';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => ShowCartCubit()..showCart(),
              child: BlocConsumer<ShowCartCubit, ShowCartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ShowCartLoading) {
                    return CircularProgressIndicator();
                  } else if (state is ShowCartError) {
                    return Text(state.message);
                  } else if (state is ShowCartSuccess) {
                    if(state.showCartResponse.data?.cartItems?.length == 0){
                      return Center(child: Text('There is no item to show'));
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  totalPrice = state.showCartResponse.data?.total;
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
                                            imageUrl: state.showCartResponse.data
                                                    ?.cartItems?[index].itemProductImage ??
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
                                              Text(state.showCartResponse.data
                                                      ?.cartItems?[index].itemProductName ??
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
                                            buildBlocConsumerRemoveFromCartButton(
                                                (){
                                                  removeFromCartCubit.removeFromCart(state.showCartResponse.data?.cartItems?[index].itemId??-1);
                                                }
                                            ),
                                            SizedBox(height:MediaQuery.of(context).size.height * .1,),
                                            Text('${
                                                  state.showCartResponse.data
                                                      ?.cartItems?[index].itemTotal
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
                                    state.showCartResponse.data?.cartItems?.length ?? 0),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.deepPurpleAccent
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Total Price : ${state.showCartResponse.data?.total}',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),),
                                ElevatedButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, CheckoutScreen.routeName);
                                    },
                                    child: Text('Check Out',style: TextStyle(

                                        fontSize: 15
                                    ),)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //     color: Colors.deepPurpleAccent
            //   ),
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Text('Total Price : $totalPrice',style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 20
            //       ),),
            //       ElevatedButton(
            //           onPressed: (){},
            //           child: Text('Check Out',style: TextStyle(
            //
            //             fontSize: 15
            //           ),)),
            //     ],
            //   ),
            // )
          ],
        ));




  }

  Widget buildBlocConsumerRemoveFromCartButton(Function() onTab) {
    return BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
      bloc: removeFromCartCubit,
      listener: (context, state) {
        if (state is RemoveFromCartSuccess) {
          buildShowToast('Removed Successfully');
        }
        if (state is RemoveFromCartError) {
          buildShowToast(state.message);
        }
      },
      builder: (context, state) {
        if (state is RemoveFromCartLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        return IconButton(
            onPressed: onTab,
            icon:  Icon(Icons.delete,color: Colors.red,))
        ;
      },
    );
  }

}
