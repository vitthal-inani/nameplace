import 'package:flutter/material.dart';
import 'package:nameplace/Providers/RoomData.dart';
import 'package:nameplace/Providers/UserData.dart';
import 'package:nameplace/Screens/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserData>(create: (_) => UserData()),
        ChangeNotifierProvider<RoomData>(create: (_) => RoomData())
      ],
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xff463F71),
          ),
          home: LoginScreen()),
    );
  }
}
