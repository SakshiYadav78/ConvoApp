import 'package:convo_app/helper/authenticate.dart';
import 'package:convo_app/helper/helperfunctions.dart';
import 'package:convo_app/views/chatrooms.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConvoApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // primaryColor: Color(0xFFFFF176),
          primaryColor:Color(0xFFFFF9C4),
        scaffoldBackgroundColor: Color(0xFFFFFDE7),
        accentColor: Color(0xFFFFF9C4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: userIsLoggedIn != null ?  userIsLoggedIn ? ChatRoom() : Authenticate()
          : Container(
        child: Center(
          child: Authenticate(),
        ),
      ),
    );
  }
}
