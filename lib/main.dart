import 'package:flutter/material.dart';
import 'package:latest_hotel/Splash.dart';
import 'package:latest_hotel/adminlogin.dart';
import 'package:latest_hotel/adminpage.dart';
import 'package:latest_hotel/confirminfo.dart';
import 'package:latest_hotel/login.dart';
import 'package:latest_hotel/profile.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:latest_hotel/signup.dart';
import 'package:latest_hotel/terms.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (ctx) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
        //Scaffold(backgroundColor: Colors.white,),
      ),
    );
  }
}

  