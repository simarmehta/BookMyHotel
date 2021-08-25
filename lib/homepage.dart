 import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:latest_hotel/confirmation%20page.dart';
import 'package:latest_hotel/detailpage.dart';
import 'package:latest_hotel/models/hotel.dart';
 import 'package:latest_hotel/login.dart';
import 'package:latest_hotel/notifications.dart';
import 'package:latest_hotel/profile.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:latest_hotel/secondary%20discard/searchservice.dart';
import 'package:latest_hotel/terms.dart';
import 'package:provider/provider.dart';
 import 'login.dart';


class HomePage extends StatefulWidget {

 String currentEmail;

 HomePage({required this.currentEmail});


  @override
  _HomePageState createState() => _HomePageState(currentEmail);
}

class _HomePageState extends State<HomePage> {
  // var queryResultSet=[];
  // var tempSearchStore=[];
  // initiateSearch(value){
  //   if(value.length==0){
  //     setState(() {
  //       queryResultSet=[];
  //       tempSearchStore=[];
  //
  //     });
  //
  //   }
    //var capitalizedValue= value.subString(0,1).toUpperCase()+ value.substring(1);
  //   if(queryResultSet.length==0 && value.length==1) {
  //       SearchHotel().searchByName(value).then((QuerySnapshot docs){
  //         for(int i=0;i<docs.documents.length; i++){
  //           queryResultSet.add(docs.documents[i].data);
  //         }
  //       });
  //
  //   }
  //   else{
  //     tempSearchStore=[];
  //     queryResultSet.forEach((element) {
  //       if (element['name'].startsWith(value)){
  //         setState(() {
  //           tempSearchStore.add(element);
  //         });
  //       }
  //     });
  //   }
  // }



  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
    {
      // Navigator.push(context, MaterialPageRoute(
      //     builder: (BuildContext context) => Login()));
    }
  }

  String currentEmail;

  _HomePageState(this.currentEmail);

  Widget _buildSinglePage(
      {required String location,required String room_url, required String name, required int price, required int rating, required String url, required int availrooms,required String key}) {
    return Card(
      margin: EdgeInsets.only(right: 30.0, bottom: 30),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      elevation: 1,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => DetailScreen(url: url,
                location: location,
                name: name,
                price: price,
                rating: rating,
                date: '',
                room: 0,
                availrooms:availrooms,
                ekey:key,
                email: currentEmail,
              room_url: room_url,)));
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url), //thumbnailUrl),
                fit: BoxFit.cover,
                scale: 3.0,
              )),
          height: 500.0,
          width: 230.0,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    for (var i = 0; i < rating; i++)
                      Icon(
                        Icons.star,
                        color: Color(0xFFFE8C68),
                        size: 30,
                      ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
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
    );

    // return Center(
    //     child:Padding(
    //       padding: const EdgeInsets.all(5.0),
    //     child:Card(
    //
    //   //shape: RoundedRectangleBorder(
    //     //borderRadius: BorderRadius.circular(20),
    //       child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children:[
    //         Stack(
    //       //alignment: Alignment.bottomLeft,
    //         children: [
    //           // Ink.image(image: AssetImage(
    //           // ""
    //           //   ),
    //           // fit: BoxFit.fitWidth,
    //           //       ),
    //         Padding(padding: const EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 0),
    //           child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //             Text(location,style: TextStyle(
    //               fontSize: 10,
    //               fontWeight: FontWeight.bold
    //           ),),
    // Text(name,style: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.bold
    // ),),
    // Text(price,style: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.bold
    // ),),
    // Text("$rating Ratings",style: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.bold
    // ),),
    // Text("$rooms",style: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.bold
    // ),),
    // Text(url,style: TextStyle(
    //     fontSize: 10,
    //     fontWeight: FontWeight.bold
    // ),),
    //     ]),)
    //     ],
    // )
    // ]

    /*Container(
              height: 50,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    decoration: BoxDecoration(
                      // image: BoxDecoration(image: )

                    ),
                  ),*/
    //        )
    //     ),
    //     ),
    // );


  }

  late MyProvider myProvider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getHotels();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.orangeAccent,
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(

                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/user.png"),

                ),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent
                ),
                accountName: Text("Hello User"),
                accountEmail: Text(currentEmail),

              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) =>
                          HomePage(currentEmail: currentEmail)));
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     CupertinoIcons.profile_circled,
              //     color: Colors.orangeAccent,
              //   ),
              //   title: Text(
              //     "Profile",
              //     textScaleFactor: 1.2,
              //     style: TextStyle(
              //       color: Colors.orangeAccent,
              //     ),
              //   ),
              //   onTap: () {
              //     Navigator.pushReplacement(context, MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             ProfilePage(email: currentEmail)));
              //   },
              // ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "Terms And Conditions",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) => TermsPage()));


                },
              ),
              ListTile(
                leading: Icon(

                  CupertinoIcons.arrow_counterclockwise,
                  color: Colors.orangeAccent,

                ),
                title: Text("Log Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                onTap: () {
                  logOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                },

              )
            ],
          ),

        ),
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
                                            _scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                          icon: Icon(
                                            Icons.sort,
                                            size: 35,
                                            color: Colors.white,
                                          ),


                                        ),
                                        IconButton(

                                          icon: Icon(Icons.notifications,
                                            size: 35,
                                            color: Colors.white,),
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context, MaterialPageRoute(
                                                builder: (
                                                    BuildContext context) =>
                                                    NotificationPage()));
                                          },
                                        )
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
                                            "Welcome User",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 26.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Book With Us Today",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Material(
                                            elevation: 10.0,
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            shadowColor: Colors.black,
                                            child: TextField(
                                              onChanged: (val){
                                              },
                                              textAlign: TextAlign.start,
                                              textAlignVertical: TextAlignVertical
                                                  .center,
                                              decoration: InputDecoration(
                                                hintText: "Search for Hotel...",
                                                prefixIcon: IconButton(
                                                  icon: Icon(Icons.search),
                                                  color: Colors.black54,
                                                  onPressed: () {},

                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),

                                  SizedBox(height: 30.0),
                                  //         Expanded(
                                  //         child:Container(
                                  //           child: Column(
                                  //             //mainAxisAlignment: MainAxisAlignment.center,
                                  //             children: [
                                  //               Container(
                                  //                 height: 100,
                                  //                 padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  //                 child: Row(
                                  //                   children:[ CircleAvatar(
                                  //
                                  //                       backgroundImage: AssetImage("images/hotel.png") ,
                                  //                       maxRadius: 80,
                                  //                     ),
                                  //
                                  //                     Container(
                                  //                       height: 50,
                                  //                       width: 180,
                                  //                       child: ListTile(
                                  //                         title: Text("Lets Pick a Hotel for",
                                  //                         style: TextStyle(
                                  //                           fontSize: 20,
                                  //                           fontWeight: FontWeight.w700,
                                  //                           color: Colors.white,
                                  //
                                  //                         ),),
                                  //                         subtitle: Text(" Tonight",
                                  //                           style: TextStyle(
                                  //                             fontSize: 20,
                                  //                             fontWeight: FontWeight.w700,
                                  //                             color: Colors.white,
                                  //
                                  //                           ),),
                                  //                       ),
                                  //                     )
                                  //             ],
                                  //                 ),
                                  //               )
                                  //             ],
                                  //           ),
                                  //           color: Colors.orangeAccent,
                                  //
                                  //         )
                                  //         )
                                  //       ],
                                  //     ),
                                  //     color: Colors.orangeAccent,
                                  //   ),
                                  // ),
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
                                            height: 370,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Expanded(
                                                  child: ListView.builder(
                                                    scrollDirection: Axis
                                                        .horizontal,
                                                    itemCount: myProvider
                                                        .hotelList.length,
                                                    itemBuilder: (ctx, index) =>
                                                        GestureDetector(

                                                          onTap: () {

                                                          },
                                                          child: _buildSinglePage(
                                                              location: myProvider
                                                                  .getHotelList[index]
                                                                  .location,
                                                              name: myProvider
                                                                  .getHotelList[index]
                                                                  .name,
                                                              price: myProvider
                                                                  .getHotelList[index]
                                                                  .price,
                                                              rating: myProvider
                                                                  .getHotelList[index]
                                                                  .rating,
                                                              availrooms: myProvider
                                                                  .getHotelList[index]
                                                                  .availrooms,
                                                              key: myProvider
                                                                  .getHotelList[index]
                                                                  .key,
                                                              url: myProvider
                                                                  .getHotelList[index]
                                                                  .url,
                                                              room_url: myProvider
                                                              .getHotelList[index]
                                                              .room_url,),

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
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: BottomNavigationBar(

                                        items: [
                                          BottomNavigationBarItem(
                                              icon: IconButton(
                                                icon: Icon(Icons.logout),
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (
                                                              BuildContext context) =>
                                                              Login()));
                                                },),
                                              title: Text("Logout")
                                          ),
                                          BottomNavigationBarItem(
                                              icon: IconButton(icon: Icon(Icons
                                                  .home),
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (
                                                              BuildContext context) =>
                                                              HomePage(currentEmail: currentEmail)));
                                                },),
                                              title: Text("Home")

                                          ),
                                        ]

                                    ),
                                  ),
                                ]
                            ),
                          )),

                    ])
            )));
  }


}