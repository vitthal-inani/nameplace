import 'package:flutter/material.dart';

class RoomData extends ChangeNotifier {
  String _roomName = "";
  int _playerCount = 0;

  String get roomName => _roomName;

  int get playerCount => _playerCount;
  List<String> _players = [];

  List<String> get players => _players;

  set roomName(String room) {
    _roomName = room;
    notifyListeners();
  }

  set playerCount(int players) {
    _playerCount = players;
    notifyListeners();
  }

  void populateRoom(Map<String, dynamic> roomData) {
    _roomName = roomData['roomId'];
    playerCount = (roomData['players'] ?? 0);
    notifyListeners();
  }

  void setHost(String player) {}
}
