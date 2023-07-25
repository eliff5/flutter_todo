import 'package:flutter/material.dart';
import 'package:flutter_todohive/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final String validPassword = "kaya";
  bool wrongPassword = false;

  // Uyarı mesajı göstermek için metod
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Uyarı"),
          content: Text("Yanlış şifre girdiniz!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Elif'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 83, 83, 81),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String enteredPassword = _passwordController.text.trim();
                if (enteredPassword == validPassword) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  setState(() {
                    wrongPassword = true;
                  });
                  showAlertDialog(context);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
