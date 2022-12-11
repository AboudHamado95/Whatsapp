import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:whatsapp/core/utils/dimensions.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key, required this.number, required this.countryCode})
      : super(key: key);
  final String number;
  final String countryCode;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Verify ${widget.countryCode} ${widget.number}',
          style: TextStyle(
              color: Colors.teal[800],
              //fontWeight: FontWeight.w700,
              fontSize: context.font16 + 0.5,
              wordSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: context.width20),
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            children: [
              SizedBox(height: context.height10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'we have sent an SMS a code to ',
                      style: TextStyle(
                          color: Colors.teal[800],
                          fontSize: context.font16 + 0.5),
                    ),
                    TextSpan(
                      text: '${widget.countryCode} ${widget.number}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: context.font26 / 2 + 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'wrong number!',
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontSize: context.font26 / 2 + 1.5),
                    )
                  ],
                ),
              ),
              SizedBox(height: context.height10 / 2),
              OTPTextField(
                length: 6,
                width: context.screenWidth,
                fieldWidth: 30,
                style: TextStyle(fontSize: context.font16 + 1),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  if (kDebugMode) {
                    print("Completed: $pin");
                  }
                },
              ),
              SizedBox(height: context.height20),
              Text(
                'Enter a digit code',
                style: TextStyle(
                    color: Colors.grey[600], fontSize: context.font26 / 2 + 1.5),
              ),
              SizedBox(height: context.height30),
              bottomButton('Resend SMS', Icons.message),
              SizedBox(height: context.height10 + 2),
              const Divider(thickness: 1.5),
              SizedBox(height: context.height10 + 2),
              bottomButton('Call Me', Icons.call),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomButton(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.teal,
          size: context.iconsSize24,
        ),
        SizedBox(width: context.width10 * 2.5),
        Text(
          text,
          style: TextStyle(color: Colors.teal, fontSize: context.font16 - 1.5),
        )
      ],
    );
  }
}
