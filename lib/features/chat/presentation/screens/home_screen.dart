// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/data/models/chat_model.dart';
import 'package:whatsapp/features/chat/presentation/screens/camera_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.chatmodels, this.sourchat})
      : super(key: key);
  final List? chatmodels;
  final ChatModel? sourchat;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "New group",
                  child: Text("New group"),
                ),
                const PopupMenuItem(
                  value: "New broadcast",
                  child: Text("New broadcast"),
                ),
                const PopupMenuItem(
                  value: "Whatsapp Web",
                  child: Text("Whatsapp Web"),
                ),
                const PopupMenuItem(
                  value: "Starred messages",
                  child: Text("Starred messages"),
                ),
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS")
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          CameraScreen(),
          // ChatPage(
          //   chatmodels: widget.chatmodels,
          //   sourchat: widget.sourchat,
          // ),
          //Text("Camera"),
          Text("Chats"),
          Text("STATUS"),
          Text("Calls"),
        ],
      ),
    );
  }
}
