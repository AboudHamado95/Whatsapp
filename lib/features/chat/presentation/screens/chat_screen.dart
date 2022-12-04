import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/presentation/screens/select_contact_screen.dart';
import 'package:whatsapp/features/chat/presentation/widgets/custom_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.chatEntities, required this.sourceChat})
      : super(key: key);
  final List<ChatEntity> chatEntities;
  final ChatEntity sourceChat;

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const SelectContactScreen()));
        },
        child: const Icon(Icons.chat, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: widget.chatEntities.length,
        itemBuilder: (context, index) => CustomCard(
          chatEntity: widget.chatEntities[index],
          sourceChat: widget.sourceChat,
        ),
      ),
    );
  }
}
