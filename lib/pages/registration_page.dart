import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/common/theme_helper.dart';
import 'package:flutter_login_userinterface/pages/login_page.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{
  final TextEditingController picNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController serviceGroupController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController channelsController = TextEditingController();
  final TextEditingController channelsNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    picNameController.dispose();
    companyNameController.dispose();
    serviceGroupController.dispose();
    serviceTypeController.dispose();
    channelsController.dispose();
    channelsNameController.dispose();
    super.dispose();
  }

  Future signUp() async{

    if (password()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
      );

      addUserDetails(
        picNameController.text.trim(),
        companyNameController.text.trim(),
        emailController.text.trim(),
        serviceGroupController.text.trim(),
        serviceTypeController.text.trim(),
        channelsController.text.trim(),
        channelsNameController.text.trim(),
      );

    }
  }

  Future addUserDetails(String email, String picName, String companyName, String serviceGroup, String serviceType, String channels, String channelsName) async{
    await FirebaseFirestore.instance.collection('users').add({
      'Email': email,
      'Pic Name' : picName,
      'Company Name' : companyName,
      'Service Group' : serviceGroup,
      'Service Type' : serviceType,
      'Channels' : channels,
      'Channels Name' : channelsName,
    });
  }


  bool password(){
    if(passwordController.text.trim()== passwordController.text.trim()){
      return true;
    } else {
      return false;
    }
  }


  final Key _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkedboxValue = false;

  @override

  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            header(),
            Container(
              height: 150,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: picNameController,
                            decoration: ThemeHelper().textInputDecoration('PIC Name', 'Masukkan Nama PIC'),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: companyNameController,
                            decoration: ThemeHelper().textInputDecoration('Company Name', 'Masukkan Nama Company'),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: emailController,
                            decoration: ThemeHelper().textInputDecoration('Email Address', "Masukkan email"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: serviceGroupController,
                            decoration: ThemeHelper().textInputDecoration('Service Group', "Shared, Dedicated, OnPrem"),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: serviceTypeController,
                            decoration: ThemeHelper().textInputDecoration('Service Type', "FAQ / Transactional"),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: channelsController,
                            decoration: ThemeHelper().textInputDecoration('Channels', "WA, Telegram, Slack, Coster, Custom"),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: channelsNameController,
                            decoration: ThemeHelper().textInputDecoration('Channels Name', "Shown / Available"),
                          ),
                          decoration: ThemeHelper.inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration('Password', "Enter your password"),
                            validator: (val){
                              if (val!.isEmpty){
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(value: checkedboxValue,
                                        onChanged: (value){
                                          setState(() {
                                            checkedboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("Saya menyetujui", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Text('Register'.toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),
                                ),
                              ),
                              onPressed: () {
                                FirebaseFirestore.instance.collection('users').add({
                                  'Pic Name' : picNameController.text,
                                  'Company Name' : companyNameController.text,
                                  'Email' : emailController.text,
                                  'Service Group' : serviceGroupController.text,
                                  'Service Type' : serviceTypeController.text,
                                  'Channels' : channelsController.text,
                                  'Channels Name' : channelsNameController.text,
                                  'Password' : passwordController.text,
                                }).then((value) {
                                  print(value);
                                });
                                FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
                                  print("Created New Account");
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });

                              },
                            ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
