import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String randomLetter;
  String timer = "0";
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    _controller.addListener(() {
      setState(() {
        timer = (_controller.value * 30).toStringAsFixed(2);
      });
    });
    randomLetter = String.fromCharCode(Random().nextInt(26) + 97).toUpperCase();
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
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: const Color(0xff463F71),
              content: const Text(
                "Are you sure you want to leave the room?",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontSize: 24,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _showLeaveRoomDialog();
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xff463F71),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
              horizontal: size.width * 0.1,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                _buildGameCircle(size),
                const SizedBox(height: 50),
                _buildFormFields(),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff463F71),
                    side: const BorderSide(color: Colors.white),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.015,
                      horizontal: size.width * 0.04,
                    ),
                  ),
                ),
                if (isLoading) const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCircle(Size size) {
    return GestureDetector(
      onTap: _startGame,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.4),
            child: SizedBox(
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.width * 0.4 * _controller.value,
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
              size.width * 0.005,
              size.width * 0.005,
              0,
              0,
            ),
            width: size.width * 0.39,
            height: size.width * 0.39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: const Color(0xff463F71),
              shape: BoxShape.circle,
            ),
            child: Text(
              randomLetter, // Display the random letter
              style: TextStyle(fontSize: 56, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildInputField("Name"),
        _buildInputField("Place"),
        _buildInputField("Animal"),
        _buildInputField("Thing"),
      ],
    );
  }

  Widget _buildInputField(String hintText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  void _showLeaveRoomDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: const Color(0xff463F71),
          content: const Text(
            "Are you sure you want to leave the room?",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontSize: 24,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                "Yes",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "No",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 24),
              ),
            ),
          ],
        );
      },
    );
  }

  void _startGame() {
    _controller.reset();
    _controller.animateTo(1);
  }

  void _submitForm() {
    setState(() {
      isLoading = true;
    });
    // Add form submission logic here
  }
}
