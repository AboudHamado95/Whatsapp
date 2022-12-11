import 'package:flutter/material.dart';

import 'package:whatsapp/core/utils/dimensions.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {Key? key,
      required this.image,
      required this.title,
      required this.time})
      : super(key: key);
  final String image;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: context.radius15 + context.radius20 / 2,
        backgroundImage: AssetImage(image),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'today at, $time',
        style: TextStyle(
            fontSize: context.font26 / 2 + 1, color: Colors.grey[900]),
      ),
    );
  }
}
