import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/home_page.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.deviceSize,
    required this.name,
    required this.controller,
    required this.textInputAction,
    required this.keyboardType,
    this.validator,
    required this.onEditingComplete,
    this.width = 0.8,
    this.icon,
    this.preficon,
    this.obsecure = false,
    this.isTablet = false,
    required AutovalidateMode autovalidateMode,
  }) : super(key: key);

  final Size deviceSize;
  final String name;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final double width;
  final IconButton? icon;
  final IconButton? preficon;
  final bool obsecure;
  final bool isTablet;

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
              isDense: true,
              hintText: name,
              labelStyle: const TextStyle(fontSize: 16),
              errorStyle: const TextStyle(
                fontSize: 12.0,
              ),
              // border: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              //   borderSide: BorderSide(
              //     width: 1.0,
              //   ),
              // ),
              // enabledBorder: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              //   borderSide: BorderSide(
              //     width: 1.0,
              //   ),
              // ),
              // focusedBorder: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              //   borderSide: BorderSide(
              //     width: 1.0,
              //   ),
              // ),
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
