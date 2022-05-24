import 'package:flutter/material.dart';
import 'package:flutter_login_userinterface/pages/theme.dart';

class ChatBubble extends StatelessWidget {

  final String ?text;
  final bool ?isSender;

  ChatBubble({this.isSender = false, this.text = ''});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color: backgroundColor4,
            ),
            child: const Text(
              'Hi, can you help me?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}