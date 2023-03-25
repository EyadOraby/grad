import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/home_page.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.deviceSize,
    required this.errorMessage,
    required this.name,
    required this.controller,
    required this.textInputAction,
    required this.keyboardType,
    required this.validator,
    required this.onEditingComplete,
    this.width = 0.8,
    this.icon,
    this.preficon,
    this.obsecure = false,
    required AutovalidateMode autovalidateMode,
  }) : super(key: key);

  final Size deviceSize;
  final double width;
  final String errorMessage;

  final String name;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final IconButton? icon;
  final IconButton? preficon;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: deviceSize.width * width,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextFormField(
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            maxLines: 1,
            obscureText: obsecure,
            validator: validator,
            onEditingComplete: onEditingComplete,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintText: name,
              errorText: errorMessage,
              labelStyle: const TextStyle(fontSize: 16),
              errorStyle: const TextStyle(
                fontSize: 12.0,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              suffixIcon: icon,
              prefixIcon: preficon,
            ),
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
