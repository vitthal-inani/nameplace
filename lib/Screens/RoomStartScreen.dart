import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nameplace/Providers/RoomData.dart';
import 'package:nameplace/Screens/GameScreen.dart';
import 'package:provider/provider.dart';

class RoomStartScreen extends StatelessWidget {
  const RoomStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    RoomData roomData = Provider.of<RoomData>(context);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color(0xff463F71),
                content: const Text(
                  "Are you sure wanna leave the room ?",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Raleway', fontSize: 24),
                ),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
                      )),
                ],
              );
            });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xff463F71),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Column(
              children: [
                const Text(
                  "ROOM NAME",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Container(
                    width: size.width * 0.45,
                    height: size.height * 0.08,
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          roomData.roomName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        IconButton(
                            onPressed: () {
                              SnackBar snackBar = const SnackBar(
                                content: Text('Room Name copied'),
                              );
                              Clipboard.setData(
                                      ClipboardData(text: roomData.roomName))
                                  .then((value) => {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar)
                                      });
                            },
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.white,
                            ))
                      ],
                    )),
                SizedBox(
                  width: size.width * 0.65,
                  child: const Text(
                    "Share this room name or copy the code by clicking the button",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameScreen()));
                    },
                    child: Text("Start"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
