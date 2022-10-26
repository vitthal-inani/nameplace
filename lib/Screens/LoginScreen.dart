import 'package:flutter/material.dart';
import 'package:nameplace/Sub%20Screens/NameValidation.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Column(
        children: [
          SizedBox(
              height: size.height * 0.25,
              child: const Image(image: AssetImage('assets/mainScreen.png'))),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
          NameValidation(),
          // Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.05),
            width: size.width * 0.8,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "How to Start",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Text(
                  "\ni. Enter a username and press Next\n\nii. a) If you would like your friends to join you, press Create Room and share the code with you friends\n\nii. b) If you have a code, press Join Room and enter the code ",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
