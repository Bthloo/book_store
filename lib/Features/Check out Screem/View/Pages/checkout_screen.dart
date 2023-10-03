import 'package:book_store/Core/Component/custom_form_field.dart';
import 'package:book_store/Core/Component/my_validators.dart';
import 'package:book_store/Features/Cart%20Tab/View/Pages/cart_tab.dart';
import 'package:book_store/Features/Check%20out%20Screem/ViewModel/Goverorate%20Cubit/governorate_cubit.dart';
import 'package:book_store/Features/Home%20Screen/View/Pages/home_screen.dart';
import 'package:book_store/Features/Profile%20tab/ViewModel/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/Component/drop_down.dart';
import '../../../../Core/Component/toast.dart';
import '../../ViewModel/Place Order /place_order_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  static const routeName = "CheckputScreen";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final SingleValueDropDownController governorateNameController =
   SingleValueDropDownController();
  final PlaceOrderCubit placeOrderCubit = PlaceOrderCubit();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CartArguments argument = ModalRoute.of(context)!.settings.arguments as CartArguments;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        title: const Text("Checkout"),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit()..profile(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoading){
              return const CircularProgressIndicator();
            }
            else if(state is ProfileError){
              return Text(state.message??'');
            }
            else if(state is ProfileSuccess){
              nameController.text = state.response?.data?.name??'';
              phoneController.text = state.response?.data?.phone??'';
              addressController.text = state.response?.data?.address??'';
              emailController.text = state.response?.data?.email??'';


              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomFormField(
                          hintText: 'name',
                          validator: (value) => MyValidators.nameValidator(value),
                          controller: nameController),
                      const SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Email',
                          validator: (value) => MyValidators.emailValidator(value),
                          controller: emailController),
                      const SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Phone',
                          validator: (value) => MyValidators.phoneValidator(value),
                          controller: phoneController),
                      const SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Address',
                          validator: (value) => MyValidators.nameValidator(value),
                          controller: addressController),
                      const SizedBox(height: 10,),
                      BlocProvider(
                        create: (context) =>
                        GovernorateCubit()
                          ..governorate(),
                        child: BlocBuilder<GovernorateCubit, GovernorateState>(
                          builder: (context, state) {
                            if (state is GovernorateLoading) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            else if (state is GovernorateSuccess) {
                              return DefaultDropDown(
                                controller: governorateNameController,
                                label: 'Select a City',
                                list: state.response.data ?? [],
                              );
                            }
                            else if (state is GovernorateError) {
                              return Text(state.message);
                            }
                            else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(

                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child : Text('Total Price : ${argument.cartResponse.data?.total}',
                        style: TextStyle(
                          color: Colors.white
                        ),
                        )
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(

                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(

                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      width: 80,
                                      height: 100,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child:  CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: argument.cartResponse.data?.cartItems?[index].itemProductImage??'',
                                        placeholder: (context, url) => SizedBox(
                                            width: double.infinity,
                                            height: 150,
                                            child: Shimmer.fromColors(
                                              baseColor: const Color(0xff56528c),
                                              highlightColor: const Color(0xff8ee6f1),
                                              child: Container(color: Colors.grey,),)),


                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.5,
                                      child: Column(
                                        crossAxisAlignment : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                                argument.cartResponse.data?.cartItems?[index].itemProductName??'',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20
                                            ),
                                            ),
                                          Row(
                                            mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Quantity :${
                                                      argument
                                                          .cartResponse
                                                          .data
                                                          ?.cartItems?[index]
                                                          .itemQuantity
                                                    }',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14
                                                ),
                                              ),
                                              Text(
                                                'Total Price :${
                                                    argument
                                                        .cartResponse
                                                        .data
                                                        ?.cartItems?[index]
                                                        .itemTotal
                                                }',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 20,),
                            itemCount: argument.cartResponse.data?.cartItems?.length??0),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        child: buildBlocConsumerPlaceOrderButton(
                            (){
                              if(formKey.currentState?.validate() == false){
                                return;
                              }
                              placeOrderCubit.placeOrder(
                                  name: nameController.text,
                                  email: emailController.text,
                                  address: addressController.text,
                                  cityId: governorateNameController.dropDownValue?.value,
                                  phone: phoneController.text);
                            }
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
            return Container();

          },
        ),
      ),
    );
  }

  Widget buildBlocConsumerPlaceOrderButton(Function() onTab) {
    return BlocConsumer<PlaceOrderCubit, PlaceOrderState>(
      bloc: placeOrderCubit,
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          buildShowToast(state.placeorderResponse.message??'');
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
        if (state is PlaceOrderError) {
          buildShowToast(state.message);
        }
      },
      builder: (context, state) {
        if (state is PlaceOrderLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
            onPressed: onTab,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Place Order',
              style: TextStyle(
                fontSize: 20
              ),
              ),
            ))


        ;
      },
    );
  }

}
