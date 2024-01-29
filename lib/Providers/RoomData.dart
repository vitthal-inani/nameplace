import 'package:flutter/material.dart';
import 'package:nameplace/constants/RoomConstants.dart';

class RoomData extends ChangeNotifier {
  String _roomName = "";
  int _playerCount = 0;
  String _host = '';
  bool _showLobby = false;
  List _players = [];
  bool _isHost = false;
  String _roomState = ROOM_STATE.ROOM_CREATED;


  String get roomName => _roomName;
  bool get showLobby => _showLobby;
  String get host => _host;
  int get playerCount => _playerCount;
  List get players => _players;
  bool get isHost => _isHost;
  String get roomState => _roomState;


  set roomName(String room) {
    _roomName = room;
    notifyListeners();
  }

  set isHost(bool value) {
    _isHost = value;
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
    _players = roomData['playerData'];
    playerCount = (roomData['players']);
    _roomState = (roomData['state']);
    notifyListeners();
  }


}
