import 'package:flutter/material.dart';
import '../utliti/font_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text, required this.onPressed,
  });

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text ;
final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(

        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(13),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle20.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
