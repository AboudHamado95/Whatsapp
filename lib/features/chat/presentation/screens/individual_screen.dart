// import 'package:camera/camera.dart';
import 'dart:convert';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/domain/entities/message_entity.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:whatsapp/features/chat/presentation/screens/camera_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/camera_view_screen.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/own_file_card.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/own_message_card.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/replay_file_card.dart';
import 'package:whatsapp/features/chat/presentation/screens/cards/replay_message_card.dart';
import 'package:http/http.dart' as http;

class IndividualScreen extends StatefulWidget {
  const IndividualScreen(
      {Key? key, required this.chatEntity, required this.sourceChat})
      : super(key: key);
  final ChatEntity chatEntity;
  final ChatEntity sourceChat;

  @override
  IndividualScreenState createState() => IndividualScreenState();
}

class IndividualScreenState extends State<IndividualScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageEntity> messages = [];
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  IO.Socket socket = IO.io("http://192.168.1.2:5000", <String, dynamic>{
    "transports": ["websocket"],
    "autoConnect": false,
  });
  XFile? file;
  ImagePicker picker = ImagePicker();
  int popTime = 0;

  @override
  void initState() {
    super.initState();
    //connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket.connect();
    socket.emit("signIn", widget.sourceChat.id);
    socket.onConnect((data) {
      if (kDebugMode) {
        print("Connected");
      }
      socket.on("message", (msg) {
        if (kDebugMode) {
          print('the message is $msg');
        }
        setMessage(
            type: "destination", message: msg["message"], path: msg["path"]);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    if (kDebugMode) {
      print('the stream is ${socket.connected}');
    }
  }

  void sendMessage(
      {required String message,
      required int sourceId,
      required int targetId,
      String? path}) {
    setMessage(type: "source", message: message, path: path!);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      'path': path
    });
  }

  void setMessage(
      {required String type, required String message, String? path}) {
    MessageEntity messageEntity = MessageEntity(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(10, 16),
      path: path ?? '',
    );
    if (kDebugMode) {
      print(messages);
    }

    setState(() {
      messages.add(messageEntity);
    });
  }

  void onImageSend(String path, String message) async {
    if (kDebugMode) {
      print('hey there working $path');
    }
    for (var i = 0; i < popTime; i++) {
      Navigator.pop(context);
    }

    setState(() {
      popTime = 0;
    });

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.2:5000/routes/addimage'));
    request.files.add(await http.MultipartFile.fromPath('img', path));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      //"Authorization": "Bearer $token"
    });
    http.StreamedResponse response = await request.send();
    var httpResponse = await http.Response.fromStream(response);
    var data = json.decode(httpResponse.body);
    setMessage(type: "source", message: message, path: path);
    socket.emit("message", {
      "message": message,
      "sourceId": widget.sourceChat.id,
      "targetId": widget.chatEntity.id,
      'path': data['path'],
    });
    if (kDebugMode) {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/whatsapp_Back.png",
          height: context.screenHeight,
          width: context.screenWidth,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.height20 * 3),
            child: AppBar(
              leadingWidth: context.width10 * 10,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: context.iconsSize24),
                    SizedBox(width: context.width10),
                    CircleAvatar(
                      radius: context.radius20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(
                        widget.chatEntity.isGroup!
                            ? "assets/images/groups.svg"
                            : "assets/images/person.svg",
                        color: Colors.white,
                        height: context.height10 * 3.6,
                        width: context.width10 * 3.6,
                      ),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(context.height30 / 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatEntity.name!,
                        style: TextStyle(
                          fontSize: context.font20 - 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "last seen today at 12:05",
                        style: TextStyle(
                          fontSize: context.font26 / 2,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: const Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  padding: const EdgeInsets.all(0),
                  onSelected: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: "View Contact",
                        child: Text("View Contact"),
                      ),
                      const PopupMenuItem(
                        value: "Media, links, and docs",
                        child: Text("Media, links, and docs"),
                      ),
                      const PopupMenuItem(
                        value: "Whatsapp Web",
                        child: Text("Whatsapp Web"),
                      ),
                      const PopupMenuItem(
                        value: "Search",
                        child: Text("Search"),
                      ),
                      const PopupMenuItem(
                        value: "Mute Notification",
                        child: Text("Mute Notification"),
                      ),
                      const PopupMenuItem(
                        value: "Wallpaper",
                        child: Text("Wallpaper"),
                      ),
                    ];
                  },
                ),
              ],
            ),
          ),
          body: WillPopScope(
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        return Container(
                          height: context.height10 * 4,
                        );
                      }
                      if (messages[index].type == "source") {
                        if (messages[index].path != null) {
                          return OwnFileCard(
                            path: messages[index].path!,
                            message: messages[index].message!,
                            time: messages[index].time,
                          );
                        } else {
                          return OwnMessageCard(
                            message: messages[index].message!,
                            time: messages[index].time,
                          );
                        }
                      } else {
                        if (messages[index].path != null) {
                          return ReplayFileCard(
                            path: messages[index].path!,
                            time: messages[index].time,
                          );
                        }
                        return ReplyCard(
                          message: messages[index].message!,
                          time: messages[index].time,
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: context.width15 / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.screenWidth - 60,
                            child: Card(
                              margin: EdgeInsets.only(
                                  left: context.width10 / 2,
                                  right: context.width10 / 2,
                                  bottom: context.height15 / 2 + 1),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(context.radius20 + 5),
                              ),
                              child: TextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      sendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      show
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions_outlined,
                                    ),
                                    onPressed: () {
                                      if (!show) {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                      }
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                      ),
                                      IconButton(
                                          icon: const Icon(Icons.camera_alt),
                                          onPressed: () {
                                            setState(() {
                                              popTime = 2;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (builder) =>
                                                    CameraScreen(
                                                        onImageSend:
                                                            onImageSend),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: context.height15 / 2 + 1,
                              right: context.width10 / 5,
                              left: context.width10 / 5,
                            ),
                            child: CircleAvatar(
                              radius: context.radius20 + 5,
                              backgroundColor: const Color(0xFF128C7E),
                              child: IconButton(
                                icon: Icon(
                                  sendButton ? Icons.send : Icons.mic,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (sendButton) {
                                    scrollController.animateTo(
                                        scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut);
                                    sendMessage(
                                        message: controller.text,
                                        sourceId: widget.sourceChat.id!,
                                        targetId: widget.chatEntity.id!,
                                        path: '');
                                    controller.clear();
                                    setState(() {
                                      sendButton = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                show ? emojiSelect() : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: context.height10 * 27.8,
      width: context.screenWidth,
      child: Card(
        margin: EdgeInsets.all(context.height10 * 1.8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.radius15)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width10, vertical: context.height20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.insert_drive_file, Colors.indigo,
                      "Document", () {}),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera",
                      () async {
                    setState(() {
                      popTime = 3;
                    });
                    if (mounted) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CameraScreen(
                          onImageSend: onImageSend,
                        );
                      }));
                    }
                  }),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery",
                      () async {
                    setState(() {
                      popTime = 2;
                    });
                    file = await picker.pickImage(source: ImageSource.gallery);
                    if (mounted) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CameraViewScreen(
                          path: file!.path,
                          onImageSend: onImageSend,
                        );
                      }));
                    }
                  }),
                ],
              ),
              SizedBox(
                height: context.height30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio", () {}),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(
                      Icons.location_pin, Colors.teal, "Location", () {}),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact", () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
      IconData icons, Color color, String text, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: context.radius30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: context.iconsSize16 * 2 - 3,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: context.height10 / 2,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: context.font26 / 2 - 1,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return Offstage(
      offstage: !show,
      child: SizedBox(
        height: 250,
        child: EmojiPicker(
          onEmojiSelected: (category, Emoji emoji) {
            if (kDebugMode) {
              print(emoji);
            }
            setState(() {
              controller.text = controller.text + emoji.emoji;
            });
          },
          onBackspacePressed: () {
            // Do something when the user taps the backspace button (optional)
          },
          textEditingController:
              controller, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
          config: Config(
            columns: 7,
            emojiSizeMax: 24 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            // initCategory: Category.RECENT,
            bgColor: const Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            backspaceColor: Colors.blue,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            showRecentsTab: true,
            recentsLimit: 28,
            noRecents: const Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ), // Needs to be const Widget
            loadingIndicator:
                const SizedBox.shrink(), // Needs to be const Widget
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          ),
        ),
      ),
    );
  }
}
