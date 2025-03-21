import 'package:flutter/material.dart';
import 'package:restaurant_app/core/api_service.dart';
import 'package:restaurant_app/screens/panel/panel_screen.dart';
import 'package:restaurant_app/widgets/appbar.dart';
import 'package:restaurant_app/widgets/icon_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final apiService = ApiService();
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  checkStatus() async {
    final response = await apiService.checkApiStatus();
    debugPrint(response.body);
    if (response.statusCode == 200) {
      debugPrint('En el 200');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconTextWidgets(label: 'Home'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text("Total: 8")),
                SizedBox(width: 20),
                Flexible(child: Text("Pendientes: 5")),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PanelScreen()),
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
