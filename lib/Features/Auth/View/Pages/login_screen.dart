import 'package:book_store/Core/Component/custom_form_field.dart';
import 'package:book_store/Core/Component/toast.dart';
import 'package:book_store/Features/Auth/ViewModel/Login/login_cubit.dart';
import 'package:book_store/Features/Auth/ViewModel/Login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../Core/Component/my_validators.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
static const routeName = "login";
 var emailController = TextEditingController();
   var passwordController = TextEditingController();

   var formKey = GlobalKey<FormState>();
   LoginCubit loginCubit = LoginCubit();

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
               SizedBox(height: 20,),
                  BlocBuilder<LoginCubit,LoginState>(
                    bloc: loginCubit,
                    builder: (context, state) {
                       if(state is LoginInitial){
                        return  SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){
                                  login();
                                },
                                child: const Center(child: Text('Login'))));
                      }
                      else if(state is LoginError){
                        buildShowToast(state.message);
                      }
                      else if(state is LoginLoading){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else if(state is LoginSuccess){
                         buildShowToast(state.message);
                      }
                      return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: (){
                                login();
                              },
                              child: const Center(child: Text('Login'))));
                    },

                  )

            ],
          ),
        ),
      ),
    );
  }
  void login(){
     if(formKey.currentState?.validate() == false){
       return;
     }
     loginCubit.login(
         email: emailController.text,
         password: passwordController.text);
  }
}
