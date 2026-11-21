import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'dart:io';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String title;
  final Size deviceSize;
  final TextEditingController controller;
  final DateTime initialDate;
  final String? Function(String?)? validate;
  const CustomDatePicker({
    super.key,
    required this.deviceSize,
    required this.controller,
    required this.initialDate,
    required this.title,
    required this.validate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          padding: EdgeInsets.symmetric(
              horizontal: widget.deviceSize.width * 0.05, vertical: 10),
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            style: const TextStyle(
              color: Colors.black,
              //fontFamily: AppFonts.fontMedium,
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
                isDense: true,
                labelText: widget.title,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    // fontFamily: AppFonts.fontRegular,
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
                  Icons.date_range,
                  size: 30,
                  color: Colors.black,
                )),
            autocorrect: false,
            cursorColor: Colors.black,
            validator: widget.validate,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              DateTime? selectedDate;
              if (widget.controller.text.isNotEmpty) {
                selectedDate =
                    DateFormat('dd-MM-yyyy').parse(widget.controller.text);
              } else {
                selectedDate = DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                );
              }

              if (Platform.isAndroid) {
                selectedDate = (await showDatePicker(
                  context: context,
                  initialDate: widget.initialDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 1200)),
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
                        dialogTheme:
                            DialogThemeData(backgroundColor: Colors.white),
                      ),
                      child: child!,
                    );
                  },
                ))!;
                widget.controller.text =
                    DateFormat('dd-MM-yyyy').format(selectedDate);
              } else if (Platform.isIOS) {
                await showCupertinoModalPopup(
                  context: context,
                  builder: (_) => Container(
                    height: widget.deviceSize.height * 0.4,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: widget.deviceSize.height * 0.09,
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                            child: Text(
                              context.t("Done"),
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              widget.controller.text = DateFormat('dd-MM-yyyy')
                                  .format(selectedDate!);
                            },
                          ),
                        ),
                        SizedBox(
                          height: widget.deviceSize.height * 0.3,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate ?? widget.initialDate,
                            maximumDate:
                                DateTime.now().add(const Duration(days: 1200)),
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 1)),
                            onDateTimeChanged: (val) {
                              setState(
                                () {
                                  selectedDate = val;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
