import 'package:flutter/material.dart';
import 'package:flutter_my_assistant/screens/login.dart';
import 'package:flutter_my_assistant/services/firebase_service.dart';

class HomePage extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  void _showSelfForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? firstName, lastName, dob, address, pincode, state, district, city, phone, email;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Self Details'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => firstName = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => lastName = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Date of Birth* (YYYY-MM-DD)'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => dob = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => address = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Pincode*'),
                    keyboardType: TextInputType.number,
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => pincode = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'State*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => state = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'District*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => district = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City*'),
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => city = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number*'),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
                    onSaved: (val) => phone = val,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email*'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) return 'Required';
                      if (!value!.contains('@')) return 'Invalid email';
                      return null;
                    },
                    onSaved: (val) => email = val,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  try {
                    await _firebaseService.saveUserDetails(
                      firstName: firstName!,
                      lastName: lastName!,
                      dob: dob!,
                      address: address!,
                      pincode: pincode!,
                      state: state!,
                      district: district!,
                      city: city!,
                      phone: phone!,
                      email: email!,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Details saved successfully!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error saving details: $e')),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Welcome! Please select an option:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text('Self'),
                onPressed: () => _showSelfForm(context),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Others'),
                onPressed: () {
                  // Handle "Others" button press if needed
                },
              ),
              // SizedBox(height: 32),
              // ElevatedButton(
              //   child: Text('Go to Login Page'),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginPage()),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}