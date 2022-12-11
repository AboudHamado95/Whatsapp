import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/dimensions.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message, required this.time})
      : super(key: key);
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(
              horizontal: context.width15, vertical: context.height10 / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: context.width10 / 2,
                  right: context.width30,
                  top: context.height10 / 2,
                  bottom: context.height10,
                ),
                child: Text(
                  message,
                  style: TextStyle(fontSize: context.font16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: context.font16 - 3,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: context.width10 / 2,
                  ),
                  Icon(
                    Icons.done_all,
                    size: context.iconsSize20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
