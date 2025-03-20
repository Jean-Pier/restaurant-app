import 'package:flutter/material.dart';

class TextCommentWidgets extends StatelessWidget {
  const TextCommentWidgets({
    super.key,
    required this.textLabel,
    required this.controller,
    this.hintText = "Escribe tu comentario...",
    this.maxLines = 5,
    this.enabled = true,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String textLabel;
  final String hintText;
  final int maxLines;
  final bool enabled;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textLabel,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: maxLines,
            enabled: enabled,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
