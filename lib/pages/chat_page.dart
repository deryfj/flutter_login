import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/pages/home_page.dart';
import 'detail_chat_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context){
    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: const Text(
          'Message Support',
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/headset.png',
                width: 80,
              ),

              //const Text(
              //'Opss no message yet?',
              //style: TextStyle(
              //fontFamily: "Montserrat",
              //color: Colors.black,
              //fontWeight: FontWeight.bold,
              //fontSize: 16,
              //),
              //),

              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const DetailChatPage()));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Explore Solution',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        emptyChat(),
      ],
    );

  }
}