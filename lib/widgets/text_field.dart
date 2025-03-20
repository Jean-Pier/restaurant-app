import 'package:flutter/material.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({
    super.key,
    required this.textLabel,
    required this.controller,
    this.hintText,
    this.inputType,
    this.enabled = true,
    this.readOnly = false,
  });

  final String textLabel;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? inputType;
  final bool enabled;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(textLabel, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              enabled: enabled,
              readOnly: readOnly,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}