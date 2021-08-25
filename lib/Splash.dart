
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latest_hotel/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SizedBox(height: 80),
                    MyImage(),
                    SizedBox(height: 30,width: 20,),
                    Text("Book Your Stays Here",style: TextStyle(
                      fontSize:24,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 20,width: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            color: Colors.orangeAccent,
                            textColor: Colors.white,
                            child: Text("Login",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                            ),),
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 52),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) => Login()));
                            }),
                      ],
                    ),

                    Expanded(child: MyBuilding())
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage image=new AssetImage("images/logo.jpg");
    Image logo=new Image(image: image,width: 200,height: 200,
    alignment: Alignment.center,);
    return logo;
  }
}

class MyBuilding extends StatelessWidget {
  const MyBuilding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage image=new AssetImage("images/building.jpg");
    Image building=new Image(image: image,width: 400,height: 400,
      alignment: Alignment.bottomCenter,);
    return building;
  }
}

