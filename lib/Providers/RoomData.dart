import 'package:flutter/material.dart';

class RoomData extends ChangeNotifier {
  String _roomName = "";
  int _playerCount = 0;
  String _host = '';
  bool _showLobby = false;
  List<String> _players = [];
  bool hasRoomCreated = false;


  String get roomName => _roomName;
  bool get showLobby => _showLobby;
  String get host => _host;
  int get playerCount => _playerCount;
  List<String> get players => _players;

  set roomName(String room) {
    _roomName = room;
    notifyListeners();
  }

  set playerCount(int players) {
    _playerCount = players;
    notifyListeners();
  }

  set host(String playerName) {
    _host = playerName;
    notifyListeners();
  }


  set showLobby(bool value) {
    _showLobby = value;
    notifyListeners();
  }

  void populateRoom(Map<String, dynamic> roomData) {
    _roomName = roomData['id'];
    playerCount = (roomData['players'] ?? 0);
    notifyListeners();
  }


  void updatePlayersList() {}
}
