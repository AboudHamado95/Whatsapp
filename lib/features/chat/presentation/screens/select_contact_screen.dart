import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/presentation/screens/create_group_screen.dart';
import 'package:whatsapp/features/chat/presentation/widgets/button_card.dart';
import 'package:whatsapp/features/chat/presentation/widgets/contact_card.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({Key? key}) : super(key: key);

  @override
  SelectContactScreenState createState() => SelectContactScreenState();
}

class SelectContactScreenState extends State<SelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatEntity> contacts = [
      ChatEntity(name: "Dev Stack", status: "A full stack developer"),
      ChatEntity(name: "Balram", status: "Flutter Developer..........."),
      ChatEntity(name: "Saket", status: "Web developer..."),
      ChatEntity(name: "Bhanu Dev", status: "App developer...."),
      ChatEntity(name: "Collins", status: "Raect developer.."),
      ChatEntity(name: "Kishor", status: "Full Stack Web"),
      ChatEntity(name: "Testing1", status: "Example work"),
      ChatEntity(name: "Testing2", status: "Sharing is caring"),
      ChatEntity(name: "Divyanshu", status: "....."),
      ChatEntity(name: "Helper", status: "Love you Mom Dad"),
      ChatEntity(name: "Tester", status: "I find the bugs"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(
                  fontSize: context.font20 - 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "256 contacts",
                style: TextStyle(
                  fontSize: context.font26 / 2,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: context.iconsSize24 + 2,
                ),
                onPressed: () {}),
            PopupMenuButton<String>(
              padding: const EdgeInsets.all(0),
              onSelected: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "Invite a friend",
                    child: Text("Invite a friend"),
                  ),
                  const PopupMenuItem(
                    value: "Contacts",
                    child: Text("Contacts"),
                  ),
                  const PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  const PopupMenuItem(
                    value: "Help",
                    child: Text("Help"),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const CreateGroupScreen()));
                  },
                  child: const ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              } else if (index == 1) {
                return const ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
