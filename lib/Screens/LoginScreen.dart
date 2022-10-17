import 'package:flutter/material.dart';
import 'package:nameplace/Sub%20Screens/NameValidation.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: Column(
        children: [
          Column(
            children: const [
              Text(
                "Name Place",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Animal Thing",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.2)),
          const NameValidation(),
        ],
      ),
    );
  }
}
