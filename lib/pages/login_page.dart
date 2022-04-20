import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/common/theme_helper.dart';
import 'package:flutter_login_userinterface/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_login_userinterface/pages/home_page.dart';


import 'registration_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final Username = new TextEditingController();
  final Password = new TextEditingController();

  saveData() async{
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setString("namaUser", Username.text.toString());
    localStorage.setString("PassUser", Password.text.toString());

    if(Username.text == "" && Password.text == ""){
      print("Tidak Bisa Masuk");
    } else {

    }
  }

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
            ),
            SafeArea(
              child: Container( //akan menjadi form login
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                        'Hello',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Selamat Datang',
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(height: 20.0),
                    Form(
                      key: _formKey,
                        child: Column(
                             children: [
                               TextField(
                                 controller : Username,
                                 decoration: ThemeHelper().textInputDecoration('Username', 'Masukkan Username'),
                               ),
                               SizedBox(height: 20.0),
                               TextField(
                                 controller: Password,
                                 obscureText: true,
                                 decoration: ThemeHelper().textInputDecoration('Password', 'Masukkan Password'),
                               ),
                               SizedBox(height: 10.0),
                               Container(
                                 alignment: Alignment.topRight,
                                 child: Text('Lupa Password'),
                               ),
                               Container(
                                 decoration: ThemeHelper().buttonBoxDecoration(context),
                                 child: ElevatedButton(
                                   style: ThemeHelper().buttonStyle(),
                                   child: Padding(
                                     padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                     child: Text('Masuk'.toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),
                                     ),
                                   ),
                                   onPressed: () {
                                     FirebaseAuth.instance.signInWithEmailAndPassword(email: Username.text, password: Password.text).then((value) {

                                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                     }).onError((error, stackTrace) {
                                       print("Error ${error.toString()}");
                                     });


                                   },
                                 ),

                               ),
                               Container(
                                 margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                 alignment: Alignment.bottomRight,
                                 //child: Text('Tidak punya akun? Buat'), // Membuat style pendukung pada form
                                 child: Text.rich(
                                   TextSpan(
                                     children: [
                                       TextSpan(text: "Tidak Punya akun?"),
                                       TextSpan(
                                         text: 'Buat',
                                         recognizer: TapGestureRecognizer()
                                           ..onTap = (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                           },
                                         style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                       ),
                                     ]
                                   )
                                 ),
                               ),
                             ],
                        )
                    ),
                  ],
                ),

            ),
            ),
          ],
        ),
      ),
    );
  }
}