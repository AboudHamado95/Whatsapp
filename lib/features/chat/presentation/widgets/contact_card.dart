import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatEntity contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: context.width10 * 5,
        height: context.height10 * 5 + 3,
        child: Stack(
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
            contact.select!
                ? Positioned(
                    bottom: context.width20 / 5,
                    right: context.width10 / 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: context.radius20 / 2 + 1,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: context.iconsSize16 + 2,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name!,
        style: TextStyle(
          fontSize: context.font16 - 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status!,
        style: TextStyle(
          fontSize: context.font26 / 2,
        ),
      ),
    );
  }
}
