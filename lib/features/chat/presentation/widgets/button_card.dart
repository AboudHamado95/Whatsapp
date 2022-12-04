import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: context.radius20 + 3,
        backgroundColor: const Color(0xFF25D366),
        child: Icon(
          icon,
          size: context.iconsSize24 + 2,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: context.font16 - 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
