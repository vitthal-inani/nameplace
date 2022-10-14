import 'package:flutter/material.dart';
import 'package:npatkeshav/Screens/JoinaRoom.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({Key? key}) : super(key: key);
  final TextEditingController usernameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      child:  Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width*0.6,
                height: size.height*0.08,
                decoration: BoxDecoration(border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6)),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8) ,
                    border: InputBorder.none,
                    hintText: 'Create A Username',
                  ),
                ),
              ),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: size.height*0.02,
                      horizontal: size.width*0.04)),
                  onPressed: () {print(usernameController.value.text);},
                  child: const Text("Next", style: TextStyle(fontSize: 24),)
              )
            ],
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(vertical: size.height*0.03),
            child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: size.height*0.02,
                        horizontal: size.width*0.04)),
                    onPressed: () {print(usernameController.value.text);},
                    child: const Text("Create A Room", style: TextStyle(fontSize: 24),)
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: size.height*0.02,
                        horizontal: size.width*0.07)),
                    onPressed: () {print(usernameController.value.text);},
                    child: const Text("Join A Room", style: TextStyle(fontSize: 24),)
                ),
                Join()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
