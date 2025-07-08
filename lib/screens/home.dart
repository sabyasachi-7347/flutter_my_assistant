import 'package:flutter/material.dart';
import 'package:flutter_my_assistant/screens/login.dart';


class HomePage extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView ( 
         padding: EdgeInsets.all(16),
         child: Center(
         child: Column(
            children: [
            ElevatedButton(
              child: Text('Go to Login Page'),
              onPressed: () {
            // 🔁 Navigate to LoginPage
               Navigator.push(
                 context,
               MaterialPageRoute(builder: (context) => LoginPage()),
               );
              },
            )]
          )
        )
        ),
    );
  }
}