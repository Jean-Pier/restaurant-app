import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/panel/panel_screen.dart';
import 'package:restaurant_app/widgets/appbar.dart';
import 'package:restaurant_app/widgets/icon_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconTextWidgets(label: 'Home'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PanelScreen(),
                  ),
                );
              },
              child: Text('next'),
            ),
          ],
        ),
      ),
    );
  }
}
