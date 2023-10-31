import 'package:flutter/material.dart';
import 'package:nameplace/Screens/GameScreen.dart';
import 'package:provider/provider.dart';

import '../Providers/RoomData.dart';

class LobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomData roomData = Provider.of<RoomData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lobby',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        backgroundColor: const Color(0xff463F71),
      ),
      backgroundColor: Color(0xff463F71),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Players in the Room',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            // Display list of players here using roomData
            // Example: Text(roomData.players.toString()),

            // Add a button to start the game
            ElevatedButton(
              onPressed: () {
                // Set the first player in the list as the host
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GameScreen()));
                if (roomData.players.isNotEmpty) {
                  roomData.setHost(roomData.players.first);
                }
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
