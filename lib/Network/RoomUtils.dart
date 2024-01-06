import 'dart:convert';
import 'WebSocket.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nameplace/Providers/RoomData.dart';
import 'package:nameplace/Providers/UserData.dart';
import 'package:provider/provider.dart';

class RoomUtils {
  static const String baseUrl = "http://192.168.1.106:8080/rooms/";

  static Future<String> createRoom(BuildContext context) async {
    try {
      final UserData userData = Provider.of<UserData>(context, listen: false);
      final RoomData roomData = Provider.of<RoomData>(context, listen: false);
      Response response = await post(Uri.parse("${baseUrl}createNewRoom"),
          body: jsonEncode({"name": userData.name}),
          headers: {'Content-type': 'application/json'}
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonRoom = jsonDecode(response.body);
        print(jsonRoom);
        roomData.populateRoom(jsonRoom);
        return "Success";
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        final String errorMessage = errorResponse['error'] ?? "Unknown Server Error";
        return "Server Error: $errorMessage";
      }
    } catch (e) {
      print("Error creating room: $e");
      return "Network Error";
    }
  }

  static Future<String> joinRoom(BuildContext context, String roomName) async {
    try {
      final UserData userData = Provider.of<UserData>(context, listen: false);
      final RoomData roomData = Provider.of<RoomData>(context, listen: false);

      Response response = await post(
        Uri.parse("${baseUrl}join"),
        body: jsonEncode({"roomName": roomName, "playerName": userData.name}),
        headers: {'Content-type': 'application/json'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonRoom = jsonDecode(response.body);
        roomData.populateRoom(jsonRoom);
        Pusher.joinChannel(roomName,context);
        return "Success";
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        final String errorMessage = errorResponse['error'] ?? "Unknown Server Error";
        return "Server Error: $errorMessage";
      }
    } catch (e) {
      print("Error joining room: $e");
      return "Network Error";
    }
  }
}

