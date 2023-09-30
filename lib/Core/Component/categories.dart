import 'package:flutter/material.dart';

class CategorisWidget extends StatelessWidget {
   CategorisWidget({super.key,required this.name});
String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.red,
      ),
      child: Text(name??'',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
    );
  }
}
