import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/panel/data/data_screen.dart';
import 'package:restaurant_app/widgets/appbar.dart';

class PanelScreen extends StatefulWidget {
  const PanelScreen({super.key});

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  bool isDatosSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(),
      body: Column(
        children: [
          isDatosSelected
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Restaurant',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDatosSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isDatosSelected ? Colors.green : Colors.grey[300],
                ),
                child: Text("Datos"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDatosSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      !isDatosSelected ? Colors.green : Colors.grey[300],
                ),
                child: Text("Fotos"),
              ),
            ],
          ),
          Expanded(child: isDatosSelected ? DataScreen() : Container()),
        ],
      ),
    );
  }
}
