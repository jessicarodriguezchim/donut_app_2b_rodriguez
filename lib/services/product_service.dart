import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:donut_app_2b_rodriguez/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const String baseUrl = "http://localhost:8080/market-app/api";

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    print('TOKEN EN SHAREDPREFERENCES: $token'); // ← Aquí verás la verdad
    return token;
  }

  static Future<List<Product>> getAllProducts() async {
    final token = await _getToken();
    print('TOKEN RECUPERADO: $token');
    final response = await http.get(
      Uri.parse("$baseUrl/products"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos");
    }
  }

  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/products/category/$categoryId"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos por categoría");
    }
  }
}
