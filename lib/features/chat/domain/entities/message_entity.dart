class MessageEntity {
  String type;
  String? message;
  String time;
  String? path;
  MessageEntity(
      {this.message, required this.type, required this.time, this.path});
}
