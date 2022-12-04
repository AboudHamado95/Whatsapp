import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.chatEntity, required this.sourceChat})
      : super(key: key);
  final ChatEntity chatEntity;
  final ChatEntity sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: Navigate to Individual Screen
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (contex) => IndividualPage(
        //               chatEntity: chatEntity,
        //               sourchat: sourchat,
        //             )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: context.radius30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatEntity.isGroup!
                    ? "assets/images/groups.svg"
                    : "assets/images/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
            ),
            title: Text(
              chatEntity.name!,
              style: TextStyle(
                fontSize: context.font16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                SizedBox(
                  width: context.width15 / 5,
                ),
                Text(
                  chatEntity.currentMessage!,
                  style: TextStyle(
                    fontSize: context.font26 / 2,
                  ),
                ),
              ],
            ),
            trailing: Text(chatEntity.time!),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: context.width20, left: context.width20 * 4),
            child: const Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
