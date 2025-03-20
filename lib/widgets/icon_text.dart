import 'package:flutter/material.dart';

class IconTextWidgets extends StatelessWidget {
  const IconTextWidgets({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          Icon(Icons.chevron_right, size: 20, color: Colors.black),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
