import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/common/theme_helper.dart';

class RegistrationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final Key _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkedboxValue = false;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Stack(
         children: [
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
                           decoration: ThemeHelper().textInputDecoration('PIC Name', 'Masukkan Nama PIC'),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 30,),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Company Name', 'Masukkan Nama Company'),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Email Address', "Masukkan email"),
                           keyboardType: TextInputType.emailAddress,
                         ),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Service Group', "Shared, Dedicated, OnPrem"),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Service Type', "FAQ / Transactional"),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Channels', "WA, Telegram, Slack, Coster, Custom"),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
                           decoration: ThemeHelper().textInputDecoration('Channels Name', "Shown / Available"),
                         ),
                         decoration: ThemeHelper.inputBoxDecorationShaddow(),
                       ),
                       SizedBox(height: 20.0),
                       Container(
                         child: TextFormField(
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
                                 Text("Saya bukan robot", style: TextStyle(color: Colors.grey),),
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
                               child: Text('Mendaftar'.toUpperCase(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.white),
                               ),
                             ),
                             onPressed: () {

                             },
                           )

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
