import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/utils/api.dart';

class ApiService {
  final Map<String, String> headers = {'x-api-key': ApiRoutes.apiKey};
  final Map<String, String> headerss = {
    'Content-Type': 'application/json',
    'x-api-key': ApiRoutes.apiKey,
  };
  
  Future<bool> checkApiStatus() async {
    final response = await http.get(
      Uri.parse(ApiRoutes.healthCheck),
      headers: headers,
    );

    return response.statusCode == 200;
  }

  Future getPhotoTypes() async {
    var response = await http.get(
      Uri.parse(ApiRoutes.photoTypes),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Error al obtener los datos. Código: ${response.statusCode}",
      );
    }
  }

  registerRestaurant(dynamic data) async {
    var response = await http.post(
      Uri.parse(ApiRoutes.restaurants),
      headers: headerss,
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      return result;
    } else {
      throw Exception("Error al registrar el restaurante");
    }
  }
}
