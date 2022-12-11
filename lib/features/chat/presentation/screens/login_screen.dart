import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/domain/entities/country_entity.dart';
import 'package:whatsapp/features/chat/presentation/screens/country_screen.dart';
import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/presentation/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String countryName = 'India';
  String countryCode = '+981';
  TextEditingController controller = TextEditingController();
  ChatEntity? sourceChat;
  List<ChatEntity>? chatEntities = [
    ChatEntity(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatEntity(
      name: "Kishor",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),

    ChatEntity(
      name: "Collins",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),

    ChatEntity(
      name: "Balram Rathore",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),

    // ChatEntity(
    //   name: "NodeJs Group",
    //   isGroup: true,
    //   currentMessage: "New NodejS Post",
    //   time: "2:00",
    //   icon: "group.svg",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Enter your phone number',
            style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w700,
                fontSize: context.font16 + 2,
                wordSpacing: 1),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.black,
            )
          ],
        ),
        body: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(children: [
            Text(
              'whatsapp will send an sms message to verify your number',
              style: TextStyle(fontSize: context.font26 / 2),
            ),
            SizedBox(height: context.height10 / 2),
            Text(
              "what's my number!",
              style: TextStyle(
                  fontSize: context.font26 / 2, color: Colors.cyan[800]),
            ),
            SizedBox(height: context.height15),
            countryCard(),
            SizedBox(height: context.height10 / 2),
            number(),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: () {
                if (controller.text.length < 10) {
                  showMyDialog();
                }
                showMyDialog();
              },
              child: Container(
                height: context.height20 * 2,
                width: context.width10 * 7,
                color: Colors.teal,
                child: const Center(
                    child: Text(
                  'NEXT',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
              ),
            ),
            SizedBox(height: context.height20 * 2),
          ]),
        )
        //    ListView.builder(
        //       itemCount: chatEntities!.length,
        //       itemBuilder: (context, index) => InkWell(
        //             onTap: () {
        //               sourceChat = chatEntities!.removeAt(index);
        //               Navigator.pushReplacement(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (builder) => HomeScreen(
        //                             chatEntities: chatEntities!,
        //                             sourceChat: sourceChat!,
        //                           )));
        //             },
        //             child: ButtonCard(
        //               name: chatEntities![index].name!,
        //               icon: Icons.person,
        //             ),
        //           )),
        );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CountryScreen(setCountryData: setCountryData);
          },
        ));
      },
      child: Container(
        width: context.screenWidth / 1.5,
        padding: EdgeInsets.symmetric(vertical: context.height10 / 2),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1))),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Center(
                  child: Text(
                    countryName,
                    style: TextStyle(fontSize: context.font16),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: context.iconsSize16 * 2 - 4,
            )
          ],
        ),
      ),
    );
  }

  Widget number() {
    return SizedBox(
      width: context.screenWidth / 1.5,
      height: context.height10 * 3.8,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: context.height10),
            width: context.width10 * 7,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.teal, width: 1.8),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '+',
                  style: TextStyle(fontSize: context.font20),
                ),
                SizedBox(width: context.width10),
                Text(
                  countryCode.substring(1),
                  style: TextStyle(fontSize: context.font20),
                )
              ],
            ),
          ),
          SizedBox(width: context.width30),
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
            width: context.screenWidth / 1.5 - 100,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(context.height15 / 2),
                  hintText: 'phone number'),
            ),
          ),
        ],
      ),
    );
  }

  void setCountryData(CountryEntity countryEntity) {
    setState(() {
      countryName = countryEntity.name;
      countryCode = countryEntity.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We will be verifying your phone number',
                  style: TextStyle(fontSize: context.font26 / 2 + 1),
                ),
                Text(
                  '$countryCode ${controller.text.trim()}',
                  style: TextStyle(
                      fontSize: context.font26 / 2 + 1,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: context.height10),
                Text(
                  'Is this ok, or would you like to edit the number!',
                  style: TextStyle(fontSize: context.font26 / 2 + 1),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return OTPScreen(
                          number: controller.text.trim(),
                          countryCode: countryCode);
                    },
                  ));
                },
                child: const Text('Edit')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'))
          ],
        );
      },
    );
  }
}
