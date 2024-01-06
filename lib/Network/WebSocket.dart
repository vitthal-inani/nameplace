import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Pusher{
  static PusherChannelsFlutter pusherInstance = PusherChannelsFlutter.getInstance();

  static intialisePusher(){
    pusherInstance.init(apiKey: "f300821eb29bd71962b3", cluster: "ap2");

  }

  static joinChannel (String roomName, BuildContext context) async{
    print("Here");

    await pusherInstance.subscribe(channelName: roomName, onEvent: onEvent,onSubscriptionError: (dynamic error){print(error);});

    await pusherInstance.connect();

  }

  static onEvent(dynamic pusherEvent){
    print("yaha");
    print(pusherEvent);
  }




}


