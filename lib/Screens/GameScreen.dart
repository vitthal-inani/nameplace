import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: const Color(0xff463F71),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05, horizontal: size.width * 0.1),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.15,
                      height: size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Text(
                        "G",
                        style: TextStyle(fontSize: 34),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.02),
                      child: Text(
                        timer,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
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
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Thing"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
