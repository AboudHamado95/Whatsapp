import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/presentation/widgets/head_own_status_widget.dart';
import 'package:whatsapp/features/chat/presentation/widgets/other_status_widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: context.height20 * 2.8,
          child: FloatingActionButton(
            backgroundColor: Colors.blueGrey[100],
            elevation: 8,
            onPressed: () {},
            child: Icon(
              Icons.edit,
              color: Colors.blueGrey[900],
            ),
          ),
        ),
        SizedBox(height: context.height15 - 2),
        FloatingActionButton(
          backgroundColor: Colors.greenAccent[700],
          elevation: 5,
          onPressed: () {},
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          /// SizedBox(height: context.height10),
          const HeadOwnStatusWidget(),
          label('Recent updates'),
          const OtherStatus(
              image: 'assets/images/bare_bears.png',
              title: 'Yaman alnajjar',
              time: '07:23'),
          const OtherStatus(
              image: 'assets/images/ben10.jpg',
              title: 'Khaled aboud',
              time: '06:43'),
          const OtherStatus(
              image: 'assets/images/food2.jpg',
              title: 'Hamdi soufi',
              time: '04:02'),
          SizedBox(height: context.height10),
          label('Viewed updates'),
          const OtherStatus(
              image: 'assets/images/food3.jpg',
              title: 'Hamza annout',
              time: '01:17'),
          const OtherStatus(
              image: 'assets/images/bravo.png',
              title: 'Omar alnajjar',
              time: '01:02'),
        ],
      )),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: context.height10 * 3.3,
      width: context.screenWidth,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.height15 / 2, horizontal: context.height10 * 1.3),
        child: Text(
          labelName,
          style: TextStyle(fontSize: context.font26 / 2),
        ),
      ),
    );
  }
}
