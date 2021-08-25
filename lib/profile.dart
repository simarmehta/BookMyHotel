
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latest_hotel/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';

import 'package:latest_hotel/login.dart';
import 'package:latest_hotel/terms.dart';


class ProfilePage extends StatelessWidget {
  String email;
  ProfilePage({required this.email});

  FirebaseAuth auth=FirebaseAuth.instance;
  Future<void> logOut() async {
    FirebaseUser user=auth.signOut() as FirebaseUser; {
      // Navigator.push(context, MaterialPageRoute(
      //     builder: (BuildContext context) => Login()));
    }
  }
  @override
  Widget build(BuildContext context) {
    final hr = Divider();
    final userStats = Positioned(
      bottom: 10.0,
      left: 40.0,
      right: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ]
      ),
    );

    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: Colors.orangeAccent,



        ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 350.0,
                      ),
                      Container(
                        height: 250.0,
                        decoration: BoxDecoration(),
                      ),
                      Positioned(top: 50, right: 0, left: 0,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  shadowColor: Colors.white,
                                  child: Container(
                                    height: 220.0,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(width: 10.0),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Welcome ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  '$email',
                                                  style: TextStyle(
                                                    color: Colors.orangeAccent,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,height: 20,),
                                                Text(
                                                  'Book With Us and enjoy your stays',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,height: 10,),
                                                Text(
                                                  'Your Chosen City is Delhi',
                                                  style: TextStyle(
                                                    color: Colors.orangeAccent,
                                                    fontSize: 23.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                        top:30,
                        child: Container(
                        ),
                      )
                    ],
                  ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 30.0),
                       child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(8.0),
                         shadowColor: Colors.white,
                         child: Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[

                              GestureDetector(child: _buildIconTile(Icons.lock, Colors.orangeAccent, ''
                                  'Go Back To Homepage'),onTap: ()
                              {
                                Navigator.push(context,MaterialPageRoute(
                                    builder:(BuildContext context)=>HomePage(currentEmail: email,)));
                                //=>moveTo(context),
                              },
                                ),
                                hr,
                                GestureDetector(child: _buildIconTile(Icons.lock_open_sharp, Colors.orangeAccent, 'Logout'),onTap: ()
                                {
                                  logOut();
                                  Navigator.push(context,MaterialPageRoute(
                                      builder:(BuildContext context)=>Login()));
                                  //=>moveTo(context),
                                },
                                ),
                                hr,
                                GestureDetector(child: _buildIconTile(Icons.lock, Colors.orangeAccent, ''
                                    'Terms and Conditions'),onTap: ()
                                {
                                  Navigator.push(context,MaterialPageRoute(
                                      builder:(BuildContext context)=>TermsPage()));
                                  //=>moveTo(context),
                                },
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }



  Widget _buildIconTile(IconData icon, Color color, String title) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      leading: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Icon(Icons.check_circle),
    );
  }
}