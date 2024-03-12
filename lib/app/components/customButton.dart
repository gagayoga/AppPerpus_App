import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final onPressed;
  final Color backgroundColor;
  final Widget child;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const Color colorPrimary =  Color(0xFF5566FF);

    return SizedBox(
        width: double.infinity,
        height: 50.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.50)
            ),
          ),
          onPressed: onPressed,
          child: child,
        )
    );
  }
}
