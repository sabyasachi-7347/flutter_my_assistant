import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Back to Home Page'),
          onPressed: () {
            // 🔙 Go back to previous screen (HomePage)
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}