import 'package:flutter/material.dart';
import 'package:nameplace/Helpers/UpperCaseFormatter.dart';
import 'package:nameplace/Network/RoomUtils.dart';
import 'package:nameplace/Providers/RoomData.dart';
import 'package:nameplace/Screens/RoomStartScreen.dart';
import 'package:provider/provider.dart';

import '../constants/NetworkConstants.dart';

class JoinDialog extends StatefulWidget {
  const JoinDialog({super.key});

  @override
  State<JoinDialog> createState() => _JoinDialogState();
}

class _JoinDialogState extends State<JoinDialog> {
  late String error;
  final TextEditingController roomNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    error = "";
  }

  @override
  Widget build(BuildContext context) {
    final RoomData roomData = Provider.of<RoomData>(context);
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: const Color(0xff463F71),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: error.isNotEmpty ? size.height * 0.36 : size.height * 0.32,
        width: size.width * 0.37,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.05, horizontal: size.width * 0.01),
        child: Column(
          children: [
            const Text(
              "Join Room",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            Container(
              width: size.width * 0.4,
              margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                autofocus: true,
                controller: roomNameController,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                textAlign: TextAlign.center,
                maxLength: 5,
                inputFormatters: [UpperCaseTextFormatter()],
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  hintText: 'Room Name',
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff463F71),
                  side: const BorderSide(color: Colors.white),
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.04)),
              onPressed: () {
                if (roomNameController.value.text.length < 4) {
                  setState(() {
                    error = "Room name should be 5 letters";
                  });
                  return;
                }
                RoomUtils.joinRoom(context, roomNameController.value.text)
                    .then((value) {
                  if (roomData.roomName != emptyRoom) {
                    setState(() {
                      error = "";
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RoomStartScreen()));
                  } else {
                    setState(() {
                      error = emptyRoom;
                    });
                  }
                });
              },
              child: const Text(
                "Join Room",
                style: TextStyle(fontSize: 18),
              ),
            ),
            (error.isNotEmpty)
                ? Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: size.width * 0.38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Flexible(
                          child: Text(
                            error,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
