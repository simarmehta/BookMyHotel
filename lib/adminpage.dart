

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latest_hotel/adminlogin.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  Widget _buildSinglePage(
      {required String email, required String username,required String number,required String name, required int rooms, required int nights, required String date}) {
    return Card(
      margin: EdgeInsets.only(right: 30.0, bottom: 30),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      elevation: 3,
      child: InkWell(
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/orange.jpg"), //thumbnailUrl),
                fit: BoxFit.cover,
                scale: 3.0,
              )),
          height: 450.0,
          width: 230.0,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#Booking",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Guest Name-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Email-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Contact Number-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        number.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "Name of Hotel Booked-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Check In Date-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),

                      Text(
                        "Number of nights-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        nights.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Number of rooms-",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        rooms.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
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
    );



  }

  late MyProvider myProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getInfo();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.orangeAccent,

        body: SafeArea(
            child: Container(
                child: Column(
                    children: [
                      Expanded(
                          child: Container(
                            child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {

                                                Navigator.pushReplacement(context, MaterialPageRoute(
                                                builder: (BuildContext context) => AdminLogin()));
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_outlined,
                                            size: 35,
                                            color: Colors.black,
                                          ),


                                        ),

                                      ],
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 24.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          //Let's start by adding the text
                                          Text(
                                            "Welcome Admin",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Access the latest bookings",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),

                                        ]),
                                  ),
                                  SizedBox(height: 30.0),

                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 480,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                    scrollDirection: Axis
                                                        .vertical,
                                                    itemCount: myProvider
                                                        .infoList.length,
                                                    itemBuilder: (ctx, index) =>
                                                        GestureDetector(

                                                          onTap: () {

                                                          },
                                                          child: _buildSinglePage(
                                                            email: myProvider
                                                                .getInfoList[index]
                                                                .email,
                                                            name: myProvider
                                                                .getInfoList[index]
                                                                .name,
                                                            date: myProvider
                                                                .getInfoList[index]
                                                                .date,
                                                            nights: myProvider
                                                                .getInfoList[index]
                                                                .nights,
                                                            rooms: myProvider
                                                                .getInfoList[index]
                                                                .rooms,
                                                            username: myProvider
                                                                .getInfoList[index]
                                                                .username,
                                                            number: myProvider
                                                                .getInfoList[index]
                                                                .number,
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
                                  ),

                                ]
                            ),
                          )),

                    ])
            )));
  }
}