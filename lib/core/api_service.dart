import 'package:http/http.dart' as http;
import 'package:restaurant_app/utils/api.dart';

class ApiService {
  final Map<String, String> headers = {'x-api-key': ApiRoutes.apiKey};
  checkApiStatus() async {
    final response = await http.get(
      Uri.parse(ApiRoutes.healthCheck),
      headers: headers,
    );

    return response;
  }
}
