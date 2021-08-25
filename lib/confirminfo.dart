import 'package:flutter/material.dart';
import 'package:latest_hotel/checkoutpage.dart';
import 'package:latest_hotel/detailpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:provider/provider.dart';

class Info extends StatefulWidget {
  String email;
  final String location,name,url;
  final int price;
  final String date;
  late int rooms;
  final int rating;
  final int nights;
  final int availrooms;
  String ekey;
  final String room_url;
  Info({required this.location,required this.room_url,required this.url,required this.name,required this.price,required this.date,required this.rooms,required this.rating,required this.email,required this.nights, required this.availrooms,required this.ekey});

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {


  bool signInState = false;
  String age = "",
      number = "",firstname="",lastname='';
  var formkey = GlobalKey<FormState>();
  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getHotels();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,

        // title: IconButton(icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: () {
        //     Navigator.pushReplacement(context, MaterialPageRoute(
        //         builder: (BuildContext context) => DetailScreen(location: "", url: widget.url, name: widget.name, price: widget.price, rating: widget.rating, date: widget.date, room: widget.rooms, email: widget.email, availrooms: widget.availrooms, ekey: widget.ekey)));
        //   },),
      ),
        backgroundColor: Colors.white,
        body: Form(
          key: formkey,
          autovalidate: true,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("To Confirm",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 35
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Please Enter the Details According to a Valid Document",

                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orangeAccent,
                        ),
                      )
                    ],
                  ),

                ),

              ),
              Theme(
                data: ThemeData(
                    hintColor: Colors.orangeAccent
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your name";
                      }
                      else {
                        firstname=value;
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.orangeAccent),
                    decoration: InputDecoration(
                      labelText: "First Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                    ),
                  ),

                ),
              ),
              Theme(
                data: ThemeData(
                    hintColor: Colors.orangeAccent
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your Last Name";
                      }
                      else {
                        lastname=value;
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.orangeAccent),
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                    ),
                  ),

                ),
              ),

              Theme(
                data: ThemeData(
                    hintColor: Colors.orangeAccent
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your age";

                      }
                      else if(value.length <2){
                        return "Age under 10 years cannot book hotel";

                      }
                      else {
                        age = value;
                      }
                      return null;
                    },

                    style: TextStyle(color: Colors.orangeAccent),
                    decoration: InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                    ),
                  ),

                ),
              ),

              Theme(
                data: ThemeData(
                    hintColor: Colors.orangeAccent
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    autocorrect: false,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your phone number";
                      } else if (value.length < 10) {
                        return "Phone Number is too short";
                      }
                      else if (value.length > 10) {
                        return "Invalid Phone Number";
                      } else
                        number = value;

                      return null;
                    },


                    style: TextStyle(color: Colors.orangeAccent),
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.orangeAccent,
                              width: 1)
                      ),
                    ),
                  ),

                ),
              ),

              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (BuildContext context) => CheckoutPage( url: widget.url, name: widget.name, price: widget.price, rating: widget.rating, date: widget.date, rooms: widget.rooms, email: widget.email, availrooms: widget.availrooms, ekey: widget.ekey, nights: widget.nights, uname: (firstname+" "+lastname), phone: number, room_url: widget.room_url,)));

                      Firestore.instance.collection('userdata').document().setData({'email': widget.email,'age': age,'firstname':firstname,'lastname':lastname,'number':number});


                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    color: Colors.orangeAccent,
                    child: Text("Continue",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  )
              ),
              SizedBox(height: 10,),

            ],
          ),
        )
    );
  }
}

