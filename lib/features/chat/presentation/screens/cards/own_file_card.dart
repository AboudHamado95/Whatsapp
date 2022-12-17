import 'dart:io';

import 'package:flutter/material.dart';

import 'package:whatsapp/core/utils/dimensions.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard(
      {super.key, required this.path, this.message, required this.time});
  final String path;
  final String? message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width15, vertical: context.height10 / 2),
        child: Container(
          height: context.screenHeight / 2.8,
          width: context.screenWidth / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.radius15),
              color: Colors.green[300]),
          child: Card(
            color: Colors.green[300],
            margin: EdgeInsets.all(context.height15 / 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.radius15)),
            child: Column(
              children: [
                Expanded(
                  child: Image.file(
                    File(path),
                    fit: BoxFit.cover,
                  ),
                ),
                message!.isNotEmpty
                    ? Container(
                        height: context.height20 * 2,
                        padding: EdgeInsets.only(
                            left: context.width15, top: context.width15 / 2),
                        child: Text(
                          message ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: context.font16,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(time),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
