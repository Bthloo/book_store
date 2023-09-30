import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key }) : super(key: key);
static const String routeName=  "OtpScreen";
//  final phoneNumber ;
  late String otpCode;

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your phone number',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: RichText(
              text: TextSpan(
                  text: 'Enter your 6 digit code numbers sent to',
                  style: const TextStyle(
                      color: Colors.black, fontSize: 18, height: 1.4),
                  children: <TextSpan>[
                    TextSpan(
                        text: '11',
                        style: const TextStyle(color: Colors.blue,)),
                  ]),
            )),
      ],
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPinCodeFields(BuildContext context){
    return Container(
      child: PinCodeTextField(
        validator: (value){
          if(value?.length!= 6){
            return "Please enter 6 digit code";
          }
          return null;
        },
        appContext: context ,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: Colors.blue,
            inactiveColor: Colors.blue,
            inactiveFillColor: Colors.white,
            activeFillColor: Colors.blue,
            selectedColor: Colors.blue,
            selectedFillColor: Colors.white,

        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          otpCode = code;
          print("Completed");
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  // void _login(BuildContext context) {
  //   BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  // }

  Widget _buildVerifyButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);

        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 88 , left: 32 , right: 32),
          child: Column(
            children: [
              _buildIntroTexts(),
              const SizedBox(height: 88),
              _buildPinCodeFields(context),
              const SizedBox(height: 60),
              _buildVerifyButton(context),
              // _buildPhoneVerificationBloc(),
            ],
          ),
        ),
      ),
    );
  }
}