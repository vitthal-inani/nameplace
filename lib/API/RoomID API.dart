// import 'package:http/http.dart' as http;
// import 'package:nameplace/API/RoomID%20Class.dart';
// import 'dart:convert';
//
// Future<RoomId> fetchRoomID(Map payload) async {
//   final response = await http.post(
//     Uri.parse('http://localhost:8080/rooms/createNewRoom'),
//     body: json.encode(payload),
//   );
//
//   final jsonData = jsonDecode(response.body);
//   final RoomId roomID = RoomId.fromJson(jsonData);
//   print(roomID);
//   return roomID;
// }
