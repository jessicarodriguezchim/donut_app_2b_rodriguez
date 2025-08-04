import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // ✅ Hacer el storage estático para poder usarlo en métodos estáticos
  static const _storage = FlutterSecureStorage();
  static const String _baseUrl = 'http://localhost:8080/market-app/api/auth';

  // ✅ Método para iniciar sesión
  static Future<bool> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'correo': email, 'contrasena': password}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final correo = data['correo'];

        if (token != null) {
          await _storage.write(key: 'jwt_token', value: token);
          if (correo != null) {
            await _storage.write(key: 'user_email', value: correo);
          }
          return true;
        }
      }

      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  // ✅ Obtener token almacenado
  static Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  // ✅ Cerrar sesión (borrar datos)
  static Future<void> logout() async {
    await _storage.deleteAll();
  }

  // ✅ Obtener correo del usuario
  static Future<String?> getUserEmail() async {
    return await _storage.read(key: 'user_email');
  }
}
