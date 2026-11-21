import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.deviceSize,
      required this.hintText,
      required this.controller,
      required this.textInputAction,
      required this.keyboardType,
      required this.validator,
      required this.onEditingComplete,
      this.width = 0.8,
      this.icon,
      this.preficon,
      this.obsecure = false,
      required this.autovalidateMode,
      required this.cursorColor});

  final Size deviceSize;
  final double width;
  final AutovalidateMode autovalidateMode;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;
  final IconButton? icon;
  final IconButton? preficon;
  final bool obsecure;
  final Color cursorColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: deviceSize.width * width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: TextFormField(
              autovalidateMode: autovalidateMode,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              maxLines: 1,
              obscureText: obsecure,
              validator: validator,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                suffixIcon: icon,
                prefixIcon: preficon,
              ),
              cursorColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
