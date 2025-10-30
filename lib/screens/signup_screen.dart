import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _error;

  void _signup() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await AuthService().signUp(_email.text.trim(), _password.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (_error != null)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red[100],
                child: Text(_error!, style: TextStyle(color: Colors.red[800])),
              ),
            SizedBox(height: 12),
            TextField(controller: _email, decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 12),
            TextField(controller: _password, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _signup,
              child: _loading ? CircularProgressIndicator(color: Colors.white) : Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
