import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_app/core/api_service.dart';
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
  final ApiService apiService = ApiService();
  var nombre = TextEditingController(text: "");
  var ruc = TextEditingController(text: "");
  var latitud = TextEditingController(text: "");
  var longitud = TextEditingController(text: "");
  var comment = TextEditingController(text: "");

  @override
  void initState() {
    _fetchLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _fetchLocation() async {
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

  regRestaurant() async {
    if (nombre.text.trim().isEmpty ||
        ruc.text.trim().isEmpty ||
        latitud.text.trim().isEmpty ||
        longitud.text.trim().isEmpty ||
        comment.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Todos los campos son obligatorios")),
      );
      return;
    }

    try {
      var data = {
        "name": nombre.text.trim(),
        "ruc": ruc.text.trim(),
        "latitude": latitud.text.trim(),
        "longitude": longitud.text.trim(),
        "comment": comment.text.trim(),
      };
      await apiService.registerRestaurant(data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Restaurante registrado con éxito")),
      );
      clearRestaurant();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar el restaurante")),
      );
    }
  }

  clearRestaurant() {
    nombre.clear();
    ruc.clear();
    latitud.clear();
    longitud.clear();
    comment.clear();
    Navigator.pop(context);
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
                  onPressed: () => clearRestaurant(),
                ),
                SizedBox(width: 15,),
                ButtonWidgets(
                  label: 'Registrar',
                  onPressed: () => regRestaurant(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
