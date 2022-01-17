import 'package:flutter/material.dart';
import 'package:wirepay_mock/utils/utils_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: textLightColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
