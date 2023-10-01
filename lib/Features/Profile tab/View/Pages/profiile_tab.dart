import 'package:book_store/Core/Component/custom_form_field.dart';
import 'package:book_store/Core/Component/my_validators.dart';
import 'package:book_store/Features/Profile%20tab/ViewModel/profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/Component/toast.dart';
import '../../ViewModel/Update Cubit/update_cubit.dart';

class ProfileTab extends StatelessWidget {
   ProfileTab({super.key});
    UpdateCubit updateCubit = UpdateCubit();
    TextEditingController nameController =  TextEditingController();
    TextEditingController phoneController =  TextEditingController();
   TextEditingController emailController =  TextEditingController();
   TextEditingController cityController =  TextEditingController();
   TextEditingController addressController =  TextEditingController();
   var updateKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileCubit()
        ..profile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoading) {
            return CircularProgressIndicator();
          }
          else if (state is ProfileError) {
            return Text(state.message ?? '');
          }
          else if (state is ProfileSuccess) {
            nameController.text = state.response?.data?.name??'';
            emailController.text = state.response?.data?.email??'';
            phoneController.text = state.response?.data?.phone??'';
            addressController.text = state.response?.data?.address??'';
            cityController.text = state.response?.data?.city??'';

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 90,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: state.response?.data?.image ?? '',
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
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Name : ${state.response?.data?.name ?? ''}',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Email : ${state.response?.data?.email ??
                          ''}', style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Phone : ${state.response?.data?.phone ??
                          ''}', style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('City : ${state.response?.data?.city ?? ''}',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Address : ${state.response?.data?.city ??
                          ''}', style: TextStyle(
                          fontSize: 20
                      ),),
                    ),
                  ),
                  SizedBox(height: 40,),
                  BlocConsumer<UpdateCubit, UpdateState>(
                    bloc: updateCubit,
                    listener: (context, state) {
                      if(state is UpdateLoading){
                        buildShowToast('Loading...');
                      }
                      else if(state is UpdateError){
                        buildShowToast(state.message);
                      }
                      else if(state is UpdateSuccess){
                        buildShowToast(state.message);
                        Navigator.pop(context);
                      }
                    },
                    builder:(context, state) =>  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Form(
                                      key: updateKey,
                                      child: Column(
                                        children: [

                                          CustomFormField(
                                              hintText: 'Name',
                                              validator:(value) => MyValidators.nameValidator(value),
                                              controller: nameController),
                                          SizedBox(height: 10,),
                                          CustomFormField(
                                              hintText: 'Email',
                                              validator:(value) => MyValidators.nameValidator(value),
                                              controller: emailController),
                                          SizedBox(height: 10,),
                                          CustomFormField(
                                              hintText: 'Phone',
                                              validator:(value) => MyValidators.nameValidator(value),
                                              controller: phoneController),
                                          SizedBox(height: 10,),
                                          CustomFormField(
                                              hintText: 'City',
                                              validator:(value) => MyValidators.nameValidator(value),
                                              controller: cityController),
                                          SizedBox(height: 10,),
                                          CustomFormField(
                                              hintText: 'Address',
                                              validator:(value) => MyValidators.nameValidator(value),
                                              controller: addressController),
                                          SizedBox(height: 10,),
                                          SizedBox(width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: (){
                                                updateCubit.update(
                                                    email: emailController.text,
                                                    name: nameController.text,
                                                    phone: phoneController.text,
                                                    address: addressController.text,
                                                    city: cityController.text);
                                              },
                                              child: Text('Update'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Update Profile', style: TextStyle(
                                fontSize: 20
                            ),),
                          )),
                    ),
                  ),

                ],

              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
