import 'package:book_store/Core/Component/custom_form_field.dart';
import 'package:book_store/Core/Component/my_validators.dart';
import 'package:book_store/Features/Check%20out%20Screem/ViewModel/Goverorate%20Cubit/governorate_cubit.dart';
import 'package:book_store/Features/Check%20out%20Screem/ViewModel/checkout_cubit.dart';
import 'package:book_store/Features/Home%20Screen/View/Pages/home_screen.dart';
import 'package:book_store/Features/Profile%20tab/ViewModel/profile_cubit.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Component/drop_down.dart';
import '../../../../Core/Component/toast.dart';
import '../../ViewModel/Place Order /place_order_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  static const routeName = "CheckputScreen";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  SingleValueDropDownController governorateNameController =
  SingleValueDropDownController();
  PlaceOrderCubit placeOrderCubit = PlaceOrderCubit();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit()..profile(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoading){
              return CircularProgressIndicator();
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
                      SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Email',
                          validator: (value) => MyValidators.emailValidator(value),
                          controller: emailController),
                      SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Phone',
                          validator: (value) => MyValidators.phoneValidator(value),
                          controller: phoneController),
                      SizedBox(height: 10,),
                      CustomFormField(
                          hintText: 'Address',
                          validator: (value) => MyValidators.nameValidator(value),
                          controller: addressController),
                      SizedBox(height: 10,),
                      BlocProvider(
                        create: (context) =>
                        GovernorateCubit()
                          ..governorate(),
                        child: BlocBuilder<GovernorateCubit, GovernorateState>(
                          builder: (context, state) {
                            if (state is GovernorateLoading) {
                              return Center(child: CircularProgressIndicator());
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
                      buildBlocConsumerPlaceOrderButton(
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
                      )
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
          return Center(child: const CircularProgressIndicator());
        }
        return ElevatedButton(
            onPressed: onTab,
            child: Text('Place Order'))


        ;
      },
    );
  }

}
