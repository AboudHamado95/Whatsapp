// import 'package:camera/camera.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp/features/chat/data/models/message_model.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/presentation/widgets/own_message_card.dart';
import 'package:whatsapp/features/chat/presentation/widgets/replay_card.dart';
import 'package:flutter/foundation.dart' as foundation;

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
  List<MessageModel> messages = [];
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  //IO.Socket socket;
  @override
  void initState() {
    super.initState();
    // connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    // connect();
  }

  // void connect() {
  //   // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
  //   socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
  //     "transports": ["websocket"],
  //     "autoConnect": false,
  //   });
  //   socket.connect();
  //   socket.emit("signin", widget.sourceChat.id);
  //   socket.onConnect((data) {
  //     print("Connected");
  //     socket.on("message", (msg) {
  //       print(msg);
  //       setMessage("destination", msg["message"]);
  //       scrollController.animateTo(scrollController.position.maxScrollExtent,
  //           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //     });
  //   });
  //   print(socket.connected);
  // }

  // void sendMessage(String message, int sourceId, int targetId) {
  //   setMessage("source", message);
  //   socket.emit("message",
  //       {"message": message, "sourceId": sourceId, "targetId": targetId});
  // }

  // void setMessage(String type, String message) {
  //   MessageModel messageModel = MessageModel(
  //       type: type,
  //       message: message,
  //       time: DateTime.now().toString().substring(10, 16));
  //   print(messages);

  //   setState(() {
  //     messages.add(messageModel);
  //   });
  // }
/*
 
   
     
*/
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
            child: Column(
              children: [
                Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: Container()
                    //  ListView.builder(
                    //   shrinkWrap: true,
                    //   controller: scrollController,
                    //   itemCount: messages.length + 1,
                    //   itemBuilder: (context, index) {
                    //     if (index == messages.length) {
                    //       return Container(
                    //         height: context.height10 * 7,
                    //       );
                    //     }
                    //     if (messages[index].type == "source") {
                    //       return OwnMessageCard(
                    //         message: messages[index].message!,
                    //         time: messages[index].time!,
                    //       );
                    //     } else {
                    //       return ReplyCard(
                    //         message: messages[index].message!,
                    //         time: messages[index].time!,
                    //       );
                    //     }
                    //   },
                    // ),
                    ),
                Padding(
                  padding: EdgeInsets.only(left: context.width15 / 2),
                  child: SizedBox(
                    height: context.height10 * 7,
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
                                  borderRadius: BorderRadius.circular(
                                      context.radius20 + 5),
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
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (builder) =>
                                            //             CameraApp()));
                                          },
                                        ),
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
                                      // sendMessage(
                                      //     controller.text,
                                      //     widget.sourceChat.id,
                                      //     widget.chatEntity.id);
                                      // controller.clear();
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
                ),
                show ? emojiSelect() : Container(),
              ],
            ),
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
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: context.height30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: context.width20 * 2,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
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
            // Do something when emoji is tapped (optional)
          },
          onBackspacePressed: () {
            // Do something when the user taps the backspace button (optional)
          },
          textEditingController:
              controller, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
          config: Config(
            columns: 7,
            emojiSizeMax: 32 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            // initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
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

    /// return EmojiPicker(
    //  textEditingController: controller,
    // config: Config(
    //   columns: 7,
    //   emojiSizeMax: 32 *
    //       (foundation.defaultTargetPlatform == TargetPlatform.iOS
    //           ? 1.30
    //           : 1.0),
    //   verticalSpacing: 0,
    //   horizontalSpacing: 0,
    //   gridPadding: EdgeInsets.zero,

    //   /// initCategory: Category.RECENT,
    //   bgColor: const Color(0xFFF2F2F2),
    //   indicatorColor: Colors.blue,
    //   iconColor: Colors.grey,
    //   iconColorSelected: Colors.blue,
    //   backspaceColor: Colors.blue,
    //   skinToneDialogBgColor: Colors.white,
    //   skinToneIndicatorColor: Colors.grey,
    //   enableSkinTones: true,
    //   showRecentsTab: true,
    //   recentsLimit: 28,
    //   replaceEmojiOnLimitExceed: false,
    //   noRecents: const Text(
    //     'No Recents',
    //     style: TextStyle(fontSize: 20, color: Colors.black26),
    //     textAlign: TextAlign.center,
    //   ),
    //   loadingIndicator: const SizedBox.shrink(),
    //   tabIndicatorAnimDuration: kTabScrollDuration,
    //   categoryIcons: const CategoryIcons(),
    //   buttonMode: ButtonMode.MATERIAL,
    //   checkPlatformCompatibility: true,
    // ),
    // onEmojiSelected: (emoji, category) {
    // if (kDebugMode) {
    //  print(emoji);
    //}
    //setState(() {
    //controller.text = controller.text + category.emoji;
    //});
    //});
  }
}
