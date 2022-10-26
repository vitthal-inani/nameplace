import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nameplace/Providers/RoomData.dart';
import 'package:nameplace/Providers/UserData.dart';
import 'package:provider/provider.dart';

class RoomUtils {
  static const String url = "http://localhost:8080/api/room/";

  static Future<String> createRoom(BuildContext context) async {
    final UserData userData = Provider.of<UserData>(context, listen: false);
    final RoomData roomData = Provider.of<RoomData>(context, listen: false);
    Response response = await post(Uri.parse("${url}create"),
        body: jsonEncode({"name": userData.name}));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonRoom = jsonDecode(response.body);
      roomData.populateRoom(jsonRoom);
    } else {
      return ("Network Error");
    }
    return ("Success");
  }

  static Future<String> joinRoom(BuildContext context, String roomName) async {
    final UserData userData = Provider.of<UserData>(context, listen: false);
    final RoomData roomData = Provider.of<RoomData>(context, listen: false);
    Response response = await post(Uri.parse("$url$roomName/join"),
        body: jsonEncode({"name": userData.name}));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonRoom = jsonDecode(response.body);
      roomData.populateRoom(jsonRoom);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Network Error")));
      return ("Network Error");
    }
    return ("Success");
  }
}
