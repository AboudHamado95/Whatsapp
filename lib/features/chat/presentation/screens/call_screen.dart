import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        callCard('Abdulrahman hamado', Icons.call_made, Colors.green,
            'July 18, 18:35'),
        callCard(
            'Yaman alnajjar', Icons.call_missed, Colors.red, 'July 19, 18:35'),
        callCard(
            'Hamdi soufi', Icons.call_made, Colors.green, 'July 20, 18:35'),
        callCard('Omar alnajjar', Icons.call_received, Colors.green,
            'July 21, 18:35'),
        callCard(
            'Khalid aboud', Icons.call_made, Colors.green, 'July 22, 18:35'),
        callCard('Abdulrahman hamado', Icons.call_missed, Colors.red,
            'July 23, 18:35'),
        callCard(
            'Yaman alnajjar', Icons.call_missed, Colors.red, 'July 24, 18:35'),
        callCard(
            'Hamdi soufi', Icons.call_made, Colors.green, 'July 25, 18:35'),
        callCard('Omar alnajjar', Icons.call_received, Colors.green,
            'July 26, 18:35'),
        callCard(
            'Khalid aboud', Icons.call_made, Colors.green, 'July 27, 18:35'),
      ]),
    );
  }

  Widget callCard(
      String name, IconData iconData, Color iconColor, String time) {
    return Card(
      margin: EdgeInsets.only(bottom: context.height10 * 0.05),
      child: ListTile(
        leading: CircleAvatar(
          radius: context.radius15 * 2 - 5,
        ),
        title: const Text(
          'Text Name',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Row(children: [
          Icon(
            Icons.call_made,
            color: Colors.green,
            size: context.iconsSize16 * 2 - 2,
          ),
          SizedBox(width: context.width15 / 2 - 1),
          Text(
            'July 18, 18:35',
            style: TextStyle(fontSize: context.font26 / 2),
          ),
        ]),
        trailing: Icon(
          Icons.call,
          color: Colors.teal,
          size: context.iconsSize24 + 2,
        ),
      ),
    );
  }
}
