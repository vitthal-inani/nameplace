import 'package:flutter/material.dart';

class NameValidation extends StatefulWidget {
  const NameValidation({Key? key}) : super(key: key);

  @override
  State<NameValidation> createState() => _NameValidationState();
}

class _NameValidationState extends State<NameValidation> {
  late String name;
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    name = "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.9,
      margin: EdgeInsets.only(left: size.width * 0.075),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: (name.isEmpty)
                ? Column(
                    children: [
                      Container(
                        width: size.width * 0.85,
                        height: size.height * 0.06,
                        margin: EdgeInsets.only(
                            top: size.height * 0.03,
                            bottom: size.height * 0.015),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          controller: usernameController,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 3, left: 10),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            hintText: 'Create Username',
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
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
                          setState(() {
                            name = usernameController.value.text;
                          });
                        },
                        label: const Text(
                          "Next",
                          style: TextStyle(fontSize: 18),
                        ),
                        icon: const Icon(Icons.arrow_forward_rounded),
                      )
                    ],
                  )
                : SizedBox(
                    width: size.width * 0.85,
                    child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xff463F71),
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.all(10),
                              elevation: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                name = "";
                              });
                            },
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 28,
                            )),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20)),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Hi, $name",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                                    horizontal: size.width * 0.04),
                              ),
                              onPressed: () {
                                setState(() {
                                  name = usernameController.value.text;
                                });
                              },
                              child: const Text(
                                "Create Room",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8)),
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
                                setState(() {
                                  name = usernameController.value.text;
                                });
                              },
                              child: const Text(
                                "Join Room",
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
