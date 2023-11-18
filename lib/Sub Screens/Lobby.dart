import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Providers/RoomData.dart';
import '../Providers/UserData.dart';

class LobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomData roomData = Provider.of<RoomData>(context);
    UserData userData = Provider.of<UserData>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Players in the Room',
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  'Host : ${roomData.host}',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rale way'),
                ),
                Text(
                  'Other Players : ${roomData.players.where((player) => player != roomData.host).join(', ')}',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway'),
                ),
                SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
