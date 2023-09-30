import 'package:book_store/Core/Component/custom_form_field.dart';
import 'package:book_store/Core/Component/toast.dart';
import 'package:book_store/Features/Auth/View/Pages/login_screen.dart';
import 'package:book_store/Features/Auth/View/Pages/verify_email.dart';
import 'package:book_store/Features/Auth/ViewModel/Login/login_cubit.dart';
import 'package:book_store/Features/Auth/ViewModel/Login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../Core/Component/my_validators.dart';
import '../../ViewModel/Register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const routeName = "register";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  RegisterCubit registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Text('Login'),
              CustomFormField(
                  hintText: 'Name',
                  validator: (value) =>
                      MyValidators.nameValidator(value),
                  controller: nameController),
              const SizedBox(height: 10,),
              CustomFormField(
                  hintText: 'Email',
                  validator: (value) =>
                      MyValidators.emailValidator(value),
                  controller: emailController),
              const SizedBox(height: 10,),
              CustomFormField(
                  hintText: 'Password',
                  validator: (value) =>
                      MyValidators.passwordValidator(value),
                  controller: passwordController),
              const SizedBox(height: 10,),
              CustomFormField(
                  hintText: 'Re-Password',
                  validator: (value) =>
                      MyValidators.repeatPasswordValidator(password: passwordController.text,value: value),
                  controller: rePasswordController),
              const SizedBox(height: 20,),
              BlocBuilder<RegisterCubit,RegisterState>(
                bloc: registerCubit,
                builder: (context, state) {
                  if(state is RegisterInitial){
                    return  SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                             register();
                            },
                            child: const Center(child: Text('Register'))));
                  }
                  else if(state is RegisterError){
                    buildShowToast(state.message);
                  }
                  else if(state is RegisterLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is RegisterSuccess){
                    buildShowToast(state.message);
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  }
                  return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            register();
                          },
                          child: const Center(child: Text('Register'))));
                },

              )

            ],
          ),
        ),
      ),
    );
  }
  void register(){
    if(formKey.currentState?.validate() == false){
      return;
    }
    registerCubit.register(
       name: nameController.text,
        rePassword: rePasswordController.text,
        email: emailController.text,
        password: passwordController.text);
  }
}
