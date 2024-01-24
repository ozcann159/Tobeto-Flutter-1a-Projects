import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.infinity,
       child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 231, 85, 105)
        ),
        onPressed: onTap, 
        child: Text("$text",
        style: TextStyle(
          color: Colors.white
        ),)
        ),
     );
  }
}
