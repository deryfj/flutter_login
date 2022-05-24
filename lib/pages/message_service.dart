import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login_userinterface/pages/message_model.dart';
class MessageService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> addMessage(
      { required bool isFromUser,
        required String message,
      }) async {
    try{
      firestore.collection('messages').add({
        'isFromUser': true,
        'message' : message,
        'createdAt' : DateTime.now().toString(),
        'updatedAt' : DateTime.now().toString(),
      }).then((value) => print('Pesan Berhasil Dikirim'));
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}