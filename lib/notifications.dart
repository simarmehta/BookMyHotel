import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:latest_hotel/homepage.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading:IconButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                    builder:(BuildContext context)=>HomePage(currentEmail: '',)));
                //=>moveTo(context),
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,

              ),
            ),
    elevation: 0.0,
    backgroundColor: Colors.orangeAccent,

    title:Text("Notifications",
    textAlign: TextAlign.center,)

        ),
            body: Center(
              child: SingleChildScrollView(
                child: Text("No New Notifications to display",
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black

                ),),
              ),
            ),
    );
  }
}
