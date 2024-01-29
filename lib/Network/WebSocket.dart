
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nameplace/Network/RoomUtils.dart';
import 'package:nameplace/Screens/GameScreen.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../Providers/RoomData.dart';

class Pusher {
  static PusherChannelsFlutter pusherInstance =
      PusherChannelsFlutter.getInstance();

  static intialisePusher() {
    pusherInstance.init(apiKey: "f300821eb29bd71962b3", cluster: "ap2");
  }

  static joinChannel(String roomName, BuildContext context) async {
    await pusherInstance.subscribe(
      channelName: roomName,
      onEvent: getEventListenerByContext(context),
      onSubscriptionError: (dynamic error) {
        print(error);
      },
    );
    await pusherInstance.connect();
  }

  static getEventListenerByContext(BuildContext context) {
    RoomData roomData = Provider.of<RoomData>(context, listen: false);
    void onEvent(dynamic pusherEvent) {
      print(pusherEvent);
      if (pusherEvent.eventName == "NEW_PLAYER_JOINED") {
        RoomUtils.getRoomDetailsByRoomId(context);
      }
      if (pusherEvent.eventName == "START_GAME") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const GameScreen(),
          ),
        );
        // roomData.isRoomStarted = true;
        // print(roomData.isRoomStarted);
      }
    }
    print("Here");
    return onEvent;
  }
}
