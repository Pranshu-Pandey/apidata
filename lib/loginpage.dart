import 'package:fetchapi/homepage.dart';
import 'package:fetchapi/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final List<User> users;

  LoginPage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _passwordController = TextEditingController();

    bool _isUserValid() {
      final name = _nameController.text;
      final password = _passwordController.text;

      for (var user in users) {
        if (user.name == name && user.password == password) {
          return true;
        }
      }

      return false;
    }

    void _login() {
      if (_formKey.currentState!.validate()) {
        if (_isUserValid()) {
          // Navigate to the home page or perform other actions
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login successful!')),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid username or password')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
