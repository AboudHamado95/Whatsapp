import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.chatEntity}) : super(key: key);
  final ChatEntity chatEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: context.radius20 + 3,
                backgroundColor: Colors.blueGrey[200],
                child: SvgPicture.asset(
                  "assets/images/person.svg",
                  color: Colors.white,
                  height: context.height30,
                  width: context.width30,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: context.radius20 / 2 + 1,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: context.iconsSize24 / 2 + 1,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.height10 / 5,
          ),
          Text(
            chatEntity.name!,
            style: TextStyle(
              fontSize: context.font26 / 2 - 1,
            ),
          ),
        ],
      ),
    );
  }
}
