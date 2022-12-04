import 'dart:io';

import 'package:flutter/material.dart';

import 'package:whatsapp/core/utils/dimensions.dart';

class CameraViewScreen extends StatelessWidget {
  const CameraViewScreen({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: context.iconsSize24,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: context.iconsSize24,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: context.iconsSize24,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: context.iconsSize24,
              ),
              onPressed: () {}),
        ],
      ),
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Stack(
          children: [
            SizedBox(
              width: context.screenWidth,
              height: context.screenHeight - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    vertical: context.height10 / 2,
                    horizontal: context.width15 / 2),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.font16,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: context.iconsSize24,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: context.font26,
                      ),
                      suffixIcon: CircleAvatar(
                        radius: context.radius30 - 3,
                        backgroundColor: Colors.tealAccent[700],
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: context.iconsSize24,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
