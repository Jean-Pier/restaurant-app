import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/core/location_service.dart';
import 'package:restaurant_app/widgets/button.dart';
import 'package:restaurant_app/widgets/text_comment.dart';
import 'package:restaurant_app/widgets/text_field.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<DataScreen> {
  final nombre = TextEditingController(text: "");
  final ruc = TextEditingController(text: "");
  final latitud = TextEditingController(text: "");
  final longitud = TextEditingController(text: "");
  final comment = TextEditingController(text: "");

  @override
  void initState() {
    _fetchLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchLocation() async {
    try {
      Position? position = await LocationService.getCurrentLocation();
      if (position != null) {
        setState(() {
          latitud.text = position.latitude.toString().trim();
          longitud.text = position.longitude.toString().trim();
        });
      }
    } catch (e) {
      setState(() {
        print("Error: $e");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidgets(
              textLabel: 'Nombre:',
              controller: nombre,
              hintText: 'Ingresen el Nombre',
              inputType: TextInputType.text,
            ),
            TextFieldWidgets(
              textLabel: 'RUC:',
              controller: ruc,
              hintText: 'Ingresen el RUC',
              inputType: TextInputType.number,
            ),
            TextFieldWidgets(
              textLabel: 'Latitud:',
              controller: latitud,
              hintText: 'Ingrese su Latitud',
              inputType: TextInputType.text,
              readOnly: true,
            ),
            TextFieldWidgets(
              textLabel: 'Longitud:',
              controller: longitud,
              hintText: 'Ingrese su Longitud',
              inputType: TextInputType.text,
              readOnly: true,
            ),
            TextCommentWidgets(textLabel: 'Comentario:', controller: comment),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonWidgets(
                  label: 'Cancelar',
                  onPressed: () {
                    print('Cancelar');
                  },
                ),
                ButtonWidgets(
                  label: 'Registrar',
                  onPressed: () {
                    print('Reg');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
