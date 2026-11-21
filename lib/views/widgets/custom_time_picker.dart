import 'package:grad/theme/sanad_colors.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatefulWidget {
  final String title;
  final Size deviceSize;
  final TextEditingController controller;
  final DateTime today;
  final String? Function(String?)? validate;
  final double width;
  const CustomTimePicker({
    super.key,
    required this.deviceSize,
    required this.controller,
    required this.today,
    required this.title,
    required this.validate,
    required this.width,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.deviceSize.width,
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: EdgeInsets.symmetric(
          horizontal: widget.deviceSize.width * 0.05, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          // fontFamily: AppFonts.fontRegular,
          fontSize: 18,
        ),
        decoration: InputDecoration(
            isDense: true,
            labelText: widget.title,
            labelStyle: const TextStyle(
                color: Colors.black,
                //fontFamily: ,
                fontSize: 18),
            errorStyle: const TextStyle(
              fontSize: 18.0,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: SanadColors.primary,
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: SanadColors.primary,
                width: 2.0,
              ),
            ),
            suffixIcon: const Icon(
              Icons.access_time_rounded,
              size: 30,
              color: Colors.black,
            )),
        cursorColor: Colors.black,
        validator: widget.validate,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          TimeOfDay time;
          if (widget.controller.text.isNotEmpty) {
            time = TimeOfDay.now();
          } else {
            time = TimeOfDay.now();
          }
          if (Platform.isAndroid) {
            final TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: time,
              builder: (_, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: Colors.black,
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                    ),
                    colorScheme: const ColorScheme.light(
                      primary: SanadColors.primary,
                      onPrimary: Colors.black,
                      brightness: Brightness.light,
                    ).copyWith(secondary: Colors.black),
                    dialogTheme: DialogThemeData(backgroundColor: Colors.white),
                  ),
                  child: child!,
                );
              },
            );
            if (newTime != null) {
              setState(() {
                time = newTime;
                widget.controller.text =
                    "${newTime.hour.toString().padLeft(2, '0')}:${newTime.minute.toString().padLeft(2, '0')}";
              });
            }
          } else if (Platform.isIOS) {
            DateTime selectedDate;
            if (widget.controller.text.isNotEmpty) {
              selectedDate = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                int.parse(widget.controller.text.split(':')[0]),
                int.parse(widget.controller.text.split(':')[1]),
              );
            } else {
              selectedDate = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                00,
                00,
              );
              widget.controller.text = DateFormat('hh:mm').format(selectedDate);
            }
            final picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(selectedDate),
            );
            if (picked != null) {
              widget.controller.text = DateFormat('hh:mm').format(DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                picked.hour,
                picked.minute,
              ));
            }
          }
        },
      ),
    );
  }
}
