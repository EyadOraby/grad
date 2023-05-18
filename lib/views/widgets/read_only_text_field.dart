import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/home_page.dart';

class ReadOnlyTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final String label;
  Function? onTap;
  ReadOnlyTextFiled(
      {Key? key,
      required this.controller,
      required this.validate,
      required this.label,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: deviceSize.width * 0.05, vertical: 10),
          child: TextFormField(
            controller: controller,
            readOnly: true,
            onTap: () {
              onTap!();
            },
            maxLines: 1,
            validator: validate,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              isDense: true,
              labelText: label,
              labelStyle: const TextStyle(
                  // color: AppColors.textFieldBorder,
                  fontSize: 15),
              errorStyle: const TextStyle(
                fontSize: 12.0,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  // color: AppColors.textFieldBorder,
                  width: 2.0,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  // color: AppColors.textFieldBorder,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  // color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
