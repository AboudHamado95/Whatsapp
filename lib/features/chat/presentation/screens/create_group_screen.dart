import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/avatar_card.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/contact_card.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);

  @override
  CreateGroupScreenState createState() => CreateGroupScreenState();
}

class CreateGroupScreenState extends State<CreateGroupScreen> {
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
  List<ChatEntity> groupMember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontSize: context.font20 - 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF128C7E),
            onPressed: () {},
            child: const Icon(Icons.arrow_forward)),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groupMember.isNotEmpty ? 90 : 10,
                    );
                  }
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == true) {
                          groupMember.remove(contacts[index - 1]);
                          contacts[index - 1].select = false;
                        } else {
                          groupMember.add(contacts[index - 1]);
                          contacts[index - 1].select = true;
                        }
                      });
                    },
                    child: ContactCard(
                      contact: contacts[index - 1],
                    ),
                  );
                }),
            groupMember.isNotEmpty
                ? Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          height: context.height15 * 5,
                          color: Colors.white,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                if (contacts[index].select == true) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        groupMember.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      chatEntity: contacts[index],
                                    ),
                                  );
                                }
                                return Container();
                              }),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
