import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password',
        style: TextStyle(
          color: Colors.white),
        ),
        backgroundColor: Colors.purpleAccent,
        leading: BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: ('Email'),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Text('Send Request'),
                textColor: Colors.white,
                onPressed: () {
                  auth.sendPasswordResetEmail(email: email);
                  Navigator.of(context).pop();
                },
                color: Colors.purpleAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}