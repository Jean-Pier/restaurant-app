import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarWidgets({super.key, this.text = "Geo Rest"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
