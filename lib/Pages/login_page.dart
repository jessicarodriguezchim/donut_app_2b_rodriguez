import 'package:donut_app_2b_rodriguez/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_2b_rodriguez/services/aut_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        final success = await AuthService.login(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        if (success) {
          final token = await AuthService.getToken();
          print('Token después de login: $token');

          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Credenciales incorrectas")),
          );
        }
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error de conexión: ${e.toString()}")),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE4E1), // Fondo rosa pastel
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'lib/images/Donutt.png', // Asegúrate de tener esta imagen
                  height: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  "¡Bienvenido a DonutApp!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Inicia sesión para comenzar",
                  style: TextStyle(fontSize: 16, color: Colors.pink),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.email, color: Colors.pink),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese su correo";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Ingrese un correo válido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock, color: Colors.pink),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.pinkAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese su contraseña";
                    }
                    if (value.length < 6) {
                      return "La contraseña debe tener al menos 6 caracteres";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _loginUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "INGRESAR",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _isLoading
                      ? null
                      : () => Navigator.pushNamed(context, "/signup"),
                  child: const Text(
                    "¿No tienes cuenta? Regístrate aquí",
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
