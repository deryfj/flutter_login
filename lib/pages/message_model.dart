class MessageModel{

  late String message;
  late int userId;
  late String userName;
  late bool isFromUser;
  late DateTime createdAt;
  late DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.isFromUser,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    isFromUser = json['isFromUser'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson(){
    return{
      'message': message,
      'userId' : userId,
      'userName' : userName,
      'isFromUser' : isFromUser,
      'createdAt' : createdAt.toString(),
      'updatedAt' : updatedAt.toString(),
    };
  }

}