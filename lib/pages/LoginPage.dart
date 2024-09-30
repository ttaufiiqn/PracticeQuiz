import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;
  bool _isObscure = true;

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          username: _username,
          nickname: _nickname,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          centerTitle: true,
          backgroundColor: Colors.teal,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,)
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              const SizedBox(height: 15),
              _passwordField(),
              const SizedBox(height: 15),
              _nicknameField(),
              const SizedBox(height: 30),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        _username = value;
      },
      decoration: InputDecoration(
        hintText: 'Enter Username',
        hintStyle: const TextStyle(color: Colors.black26),
        prefixIcon: const Icon(Icons.person, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2.0),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      enabled: true,
      obscureText: _isObscure, // Atur apakah password disembunyikan atau tidak
      onChanged: (value) {
        _password = value;
      },
      decoration: InputDecoration(
        hintText: 'Enter Password',
        hintStyle: const TextStyle(color: Colors.black26),
        prefixIcon: const Icon(Icons.lock, color: Colors.teal),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility, // Ikon berubah sesuai kondisi
            color: Colors.teal,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2.0),
        ),
      ),
    );
  }

  Widget _nicknameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        _nickname = value;
      },
      decoration: InputDecoration(
        hintText: 'Enter Nickname',
        hintStyle: const TextStyle(color: Colors.black26),
        prefixIcon: const Icon(Icons.tag_faces, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2.0),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isClicked ? Colors.teal : Colors.tealAccent[400],
          ),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onPressed: () {
          if (_username == "Taufiq" && _password == "mobile") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successful'),
                backgroundColor: Colors.teal,
              ),
            );
            setState(() {
              isClicked = true;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid Username or Password'),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

