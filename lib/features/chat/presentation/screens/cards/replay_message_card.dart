import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.radius15 / 2 + 1)),
          // color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(
              horizontal: context.width15, vertical: context.height10 / 2),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: context.width15 / 2 + 1,
                  right: context.width10 * 5,
                  top: context.height10 / 2,
                  bottom: context.height10,
                ),
                child: Text(
                  message,
                  style: TextStyle(fontSize: context.font16),
                ),
              ),
              Positioned(
                bottom: context.height20 / 5,
                right: context.width10,
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: context.font26 / 2,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
