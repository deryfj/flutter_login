import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/pages/chat_bubble.dart';
import 'package:flutter_login_userinterface/pages/message_service.dart';
import 'package:flutter_login_userinterface/pages/theme.dart';

class DetailChatPage extends StatefulWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {

  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child : AppBar(
          backgroundColor: Colors.purpleAccent,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset('assets/img/user.png',
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: const [
                  Text(
                    'Customer Care',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'online',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput(){
      return Container(
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: secondaryTextColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TextFormField(
                    controller: messageController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Type Message...',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                MessageService().addMessage(
                  isFromUser: true,
                  message: messageController.text,
                );

                setState(() {
                  messageController.text = '';
                });
              },
              child: Image.asset('assets/img/send-message.png',
                width: 45,
              ),
            ),
          ],
        ),
      );
    }

    Widget content(){
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hallo, Customer Care',
          ),
          ChatBubble(
            isSender: false,
            text: 'Selamat malam, bisakah membantu menemukan paket saya yang hilang?',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: primaryTextColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}