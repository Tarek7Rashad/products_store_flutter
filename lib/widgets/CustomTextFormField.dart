import 'package:flutter/material.dart';
import 'package:product_store/shared/Components/constant.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.onChanged,
    this.input = TextInputType.text,
  });
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType input;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: input,
      obscureText: obscureText,
      style: const TextStyle(color: kBlueGreyColor, fontSize: 20),
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 70),
        labelText: labelText,
        labelStyle: const TextStyle(color: kBlackColor, fontSize: 20),
        hintText: hintText,
        hintStyle: const TextStyle(color: kBlueGreyColor, fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 0.4,
            color: kBlueGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2, color: kBlueGreyColor),
        ),
      ),
    );
  }
}
