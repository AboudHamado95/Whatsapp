import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/features/chat/presentation/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            children: [
              SizedBox(height: context.height10 * 5),
              Text(
                'Welcome to Whatsapp',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: context.font16 * 2 - 2,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: context.screenHeight / 8,
              ),
              Image.asset('assets/images/whatsapp_Back.png',
                  color: Colors.white.withOpacity(.2),
                  height: context.height10 * 34,
                  width: context.width10 * 50),
              SizedBox(height: context.screenHeight / 7.5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black, fontSize: context.font16 + 1),
                      children: [
                        TextSpan(
                          text: 'Agree and Continue to accept the ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const TextSpan(
                          text: 'whatsApp Terms of Service and Privacy Policy',
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ]),
                ),
              ),
              SizedBox(height: context.height20),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  },
                  ), (route) => false);
                },
                child: SizedBox(
                  height: context.height10 * 5,
                  width: context.screenWidth - 110,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.greenAccent[700],
                    child: Center(
                      child: Text(
                        'AGREE AND CONTINUE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: context.font20 - 2),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
