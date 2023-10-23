import 'package:flutter/material.dart';
import 'package:nameplace/Screens/LoginScreen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String timer = "0";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    _controller.value = 0;
    _controller.addListener(() {
      setState(() {
        timer = (_controller.value * 30).toStringAsFixed(2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          leading: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xff463F71),
                        content: const Text(
                          "Are you sure wanna leave the room ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 24),
                        ),
                        actions: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0),
                              onPressed: () {
                                Navigator.popUntil(
                                    context, (route) => route.isFirst);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 24),
                              )),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    fontFamily: 'Raleway', fontSize: 24),
                              )),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.close)),
        ),
        backgroundColor: const Color(0xff463F71),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.width * 0.1),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              size.width * 0.185,
                            ),
                            child: SizedBox(
                              height: size.width * 0.185,
                              width: size.width * 0.185,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: size.width * 0.2 * _controller.value,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff3a9aff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                size.width * 0.0075, size.width * 0.0075, 0, 0),
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0xff463F71),
                                shape: BoxShape.circle),
                            child: const Text(
                              "G",
                              style:
                                  TextStyle(fontSize: 34, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.02),
                        child: Text(
                          timer,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: size.height * 0.03)),
                  ElevatedButton(
                      onPressed: () {
                        _controller.reset();
                        _controller.animateTo(1);
                      },
                      child: Text("Start")),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Place"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Animal"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Thing"),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
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
                      showDialog(
                          context: context,
                          builder: (context){
                            return Center(child: CircularProgressIndicator());
                          },
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
