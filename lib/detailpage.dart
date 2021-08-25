
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latest_hotel/checkoutpage.dart';
import 'package:latest_hotel/confirminfo.dart';
import 'package:latest_hotel/homepage.dart';
import 'package:latest_hotel/profile.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:latest_hotel/terms.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  String email;
  final String location,name,url;
  final int price,rating;
  final String date;
  late int room;
  late int availrooms;
  final String ekey;
  final String room_url;
  DetailScreen({required this.location,required this.room_url,required this.url,required this.name,required this.price,required this.rating,required this.date,required this.room,required this.email, required this.availrooms, required this.ekey});

  @override
  _DetailScreenState createState() => _DetailScreenState(email);
}

class _DetailScreenState extends State<DetailScreen> {
  String email;
  _DetailScreenState( this.email);

  DateTime currentDate = DateTime.now();

  get ekey => null;
  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(currentDate);
          }
  }
  Future<void> _selectDate(BuildContext context) async {
    bool _decideWhichDayToEnable(DateTime day) {
      if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
          day.isBefore(DateTime.now().add(Duration(days: 165))))) {
        return true;
      }
      return false;
    }
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2022),
        selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  late String date="dd-mm-yyyy";

  final String image= "images/logo1.jpg";

  late MyProvider myProvider;
  int noOfRooms = 0;
  int noOfNights=0;


  @override
  Widget build(BuildContext context) {
    myProvider=Provider.of<MyProvider>(context);
    myProvider.getHotels();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              color: Colors.black12
            ),
              height: 400,
              child: Image.network(widget.room_url,fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16,bottom: 20),

            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 250,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(widget.name,style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),),
                  ),

                  Row(
                    children: [
                      const SizedBox(height: 0,width: 16,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8
                        ,horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Only ${widget.availrooms} rooms left",style: TextStyle(fontSize: 17),),
                      ),

                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.note_rounded),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) => TermsPage()));
                        },
                      )
                    ],

                  ),

                  Container(
                  padding: const EdgeInsets.all(32),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [
                                      const SizedBox(height: 10,),
                                for (var i = 0; i < widget.rating; i++)
                                    Icon(
                                    Icons.star,
                                      color: Color(0xFFFE8C68),
                                      size: 30,
                                        ),
                                       ]
                                  ),
                                ],
                              ),

                            ),
                            Column(
                              children: [
                                Text("\₹"+widget.price.toString(),style: TextStyle(
                                  color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                                Text("per night")
                              ],
                            )
                          ],

                      ),
                        Text("Location",style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          color: Colors.grey
                        )),
                        const SizedBox(height: 5,),
                        Text(widget.location
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        const SizedBox(height: 20,),
                        Text("Description",style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.grey
                        )),
                        const SizedBox(height: 10,),
                        Text("Experience the perfect blend of innovative design, relaxing inspiration and value for money. Our air-conditioned and functionally equipped with flat screen TV, among others, provide everything needed for a comfortable stay.  For families and groups, multi-bed rooms are available. We look forward to seeing you at Hotel"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        const SizedBox(height: 10,),
                        Text("Ameneties",style:TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                            color: Colors.grey
                        )),

                        const SizedBox(height: 5,),
                        Text("WiFi Enabled"
                            ,textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),),
                        Text("Swimming Pool"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        Text("Bar and Lounge"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        const SizedBox(height: 5,),
                        Text("24x7 Room Service"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        Text("Gym"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        const SizedBox(height: 5,),
                        const SizedBox(height: 10,),
                        Text("Note:",style:TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.grey
                        )),

                        const SizedBox(height: 5,),
                        Text("Only 2 adults allowed per room"
                          ,textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),),
                        const SizedBox(height: 10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CheckIn Date",style:TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.grey
                            )),
                            // Text(currentDate.toString()),
                        MaterialButton(
                          height: 35,
                          color: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)

                          ),

                          onPressed: () => _selectDate(context),
                          child: Text(getText(),
                          style: TextStyle(
                            fontSize: 15,
                          ),),
                        ),],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("No of Nights",style:TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              color: Colors.grey


                            )),

                        Container(
                          width: 110,

                        decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.grey,
                        width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,

                        child:
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              iconSize: 14,
                              padding: const EdgeInsets.all(4),
                              icon: Icon(Icons.minimize),
                              onPressed: () {
                                  setState(() {
                                    noOfNights--;
                                  });
                              },
                            ),
                            Text(noOfNights.toString()),
                            IconButton(
                              iconSize: 14,
                              padding: const EdgeInsets.all(4),
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  noOfNights++;
                                });
                                // Text(noOfRooms.toString());

                              },
                            ),
                          ],
                        ),
                        ),

                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("No of Rooms",style:TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.grey
                        )),

                        Container(
                          width: 110,

                        decoration: BoxDecoration(
                        border: Border.all(
                        color: Colors.grey,
                        width: 1,

                        ),
                        borderRadius: BorderRadius.circular(10),

                        ),
                        height: 40,
                        child:
                        Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        IconButton(
                        iconSize: 14,
                        padding: const EdgeInsets.all(4),
                        icon: Icon(Icons.minimize),
                        onPressed: () {
                        if (noOfRooms > 0) {
                           setState(() {
                        noOfRooms--;
                        });
                        }}
                        ),
                        Text(noOfRooms.toString()),
                        IconButton(
                        iconSize: 14,
                        padding: const EdgeInsets.all(4),
                        icon: Icon(Icons.add),
                        onPressed: () {
                        setState(() {
                        noOfRooms++;
                        });

                        // Text(noOfRooms.toString());

                        },
                        ),
                        ],
                        ),
                        ),
                        ],),
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            color: Colors.orange,
                            textColor: Colors.white,
                            child: Text("Book Now",style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),),
                            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                            onPressed: () {
                              if (widget.availrooms<1) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text(" Sorry!\nNo rooms left\nThe hotel is completely booked at the moment"),
                                          actions:[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ]
                                      );
                                    });
                              }
                              else if (noOfRooms<1 && noOfNights<1) {
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              title: Text("Please choose number of rooms and number of nights"),
                                  actions:[
                              FlatButton(
                              child: Text("Close"),
                                onPressed: (){
                                Navigator.of(context).pop();
                                },
                                ),
                                ]
                              );
                              });
                              }
                              else if (noOfNights<1) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text("Please choose number of nights"),
                                          actions:[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]
                                      );
                                    });
                              }
                              else if ( noOfRooms<1) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text("Please choose number of rooms"),
                                          actions:[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]
                                      );
                                    });
                              }
                              else if ( noOfRooms>5) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text("One user cannot book more than 5 rooms"),
                                          actions:[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]
                                      );
                                    });
                              }
                              else if ( widget.availrooms<noOfRooms) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Text("${noOfRooms} rooms are currently not available at this hotel "),
                                          actions:[
                                            FlatButton(
                                              child: Text("Close"),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ]
                                      );
                                    });
                              }
                              else {
                                String dateFormat = DateFormat("dd-MM-yyyy").format(DateTime.parse(currentDate.toString()));
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Info(
                                          url: widget.url,
                                          name: widget.name,
                                          price: widget.price,
                                          date: dateFormat,
                                          rooms: noOfRooms,
                                          rating: widget.rating,
                                          nights: noOfNights,
                                          email: email,
                                          availrooms: widget.availrooms, ekey: widget.ekey, location: widget.location,room_url: widget.room_url,
                                        )));
                              }
                            },

                          ),
                        ),

                        //  TextFormField(
                        //   validator: (value){
                        //     if(value!.isEmpty){
                        //       return"Please enter a date";
                        //      }
                        //       else{
                        //       date=value;
                        //     }
                        //     return null;
                        //
                        //   },
                        //   style: TextStyle(color: Colors.lightBlueAccent),
                        //   decoration: InputDecoration(
                        //     labelText: "Date",
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //         borderSide: BorderSide(color:Colors.lightBlueAccent,width: 1)
                        //     ),
                        //     disabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //         borderSide: BorderSide(color: Colors.lightBlueAccent,width: 1)
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //         borderSide: BorderSide(color: Colors.lightBlueAccent,width: 1)
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(15),
                        //         borderSide: BorderSide(color: Colors.lightBlueAccent,width: 1)
                        //     ),
                        //   ),
                        // ) ,
                        const SizedBox(height: 10,),
                      ],

                    ),
                  )
                ],
              ),
            ),

          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,

            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,

             leading:IconButton(icon:Icon(Icons.arrow_back_ios),

                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                        builder:(BuildContext context)=>HomePage(currentEmail: email,)));
                  },
                  ),
                      centerTitle: true,

                    ),),
          SizedBox(height: 100,),

          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: BottomNavigationBar(
          //
          //
          //     items:[
          //       BottomNavigationBarItem(
          //         icon: IconButton(icon:Icon(Icons.arrow_back_ios,size: 10,),
          //
          //       onPressed: () {
          //         Navigator.push(context,MaterialPageRoute(
          //             builder:(BuildContext context)=>HomePage(currentEmail: email,)));
          //       },
          //       ),
          //       title: Text("Back")
          //       ),
          //       BottomNavigationBarItem(
          //           icon: IconButton(icon:Icon(Icons.fiber_manual_record_rounded),
          //
          //             onPressed: () {
          //               Navigator.push(context,MaterialPageRoute(
          //                   builder:(BuildContext context)=>ProfilePage(email: email)));
          //             },
          //           ),
          //           title: Text("Profile")
          //       ),]
          //   ),
          // )

        ],
      ),

    );


  }
}
