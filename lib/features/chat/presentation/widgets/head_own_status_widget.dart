import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class HeadOwnStatusWidget extends StatelessWidget {
  const HeadOwnStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: context.radius30 - 3,
            backgroundColor: Colors.white,
            backgroundImage: const AssetImage('assets/images/aboanas.jpg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent[700],
              radius: context.radius20 / 2,
              child: Icon(
                Icons.add,
                size: context.iconsSize20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      title: const Text(
        'My Status',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        'Tap to add status update',
        style: TextStyle(fontSize: context.font26 / 2, color: Colors.grey[900]),
      ),
    );
  }
}
