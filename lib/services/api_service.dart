import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String baseUrl =
      'http://<Your-IP-Address>:3000'; // Use your local IP

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List decoded = jsonDecode(response.body);
      return decoded.map((e) => Product.fromJson(e)).toList();  
    } else {
      throw Exception('Failed to load products');
    }
  }

}
