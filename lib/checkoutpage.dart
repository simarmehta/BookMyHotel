import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:latest_hotel/detailpage.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';
import 'confirmation page.dart';
import 'models/hotel.dart';



class CheckoutPage extends StatefulWidget {
  String email;
 String uname;
 final String phone;
  final int price;
  final String name;
  final String url;
  final String date;
  final String ekey;
  final int rating;
  late int rooms;
  late int nights;
  late int availrooms;
  final String room_url;


  CheckoutPage({required this.url,required this.room_url,required this.name,required this.price,required this.date,required this.rooms,required this.rating,required this.nights,required this.availrooms,required this.ekey,required this.email,required this.uname, required this.phone,});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final String image= "images/logo1.jpg";

  late MyProvider myProvider;

  double discount=0;

  double sc=0;

  double total=0;
  var addDt = DateTime.now();


  final List<String> payList = <String>[
    "Cash",
    "Card",
    "UPI",
  ];
  String _value1= "Cash";
  void initState() {
    super.initState();
    _value1 = payList[0];
  }
  main() async {
    String username = 'hotelapp7801@gmail.com';
    String password = 'red@7801';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username,)
      ..recipients.add("tajplace7821@gmail.com")
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Hotel Booking Confirmation'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1> Booking Confirmation</h1>\n<p> ${widget.name}.</p></p>This email is to confirm that a reservation for your hotel on ${ DateFormat("dd-MM-yyyy").format(DateTime.parse(addDt.toString()))} for a single room with breakfast has been booked by ${widget.uname}. <p>The check-in date shall be ${widget.date} and the stay would be for  ${widget.nights} nights.<p>Further details of the booking are listed below:</p><p>Number of Rooms: ${widget.rooms} </p><p>Type: Single</p> <p>CheckIn Time: 1:00 pm</p><p>Best Regards</p><p>The Hotel App</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }




    final equivalentMessage = Message()
      ..from = Address(username, 'Your name 😀')
      ..recipients.add(Address('destination@example.com'))
      ..ccRecipients.addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
      ..bccRecipients.add('bccAddress@example.com')
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>'
      ..attachments = [

      ];

    final sendReport2 = await send(equivalentMessage, smtpServer);


    var connection = PersistentConnection(smtpServer);


    await connection.send(message);

    await connection.send(equivalentMessage);


    await connection.close();

  }


   @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getHotels();

    discount=((widget.price*widget.rooms*widget.nights)/10);
    sc=(widget.price*widget.rooms*widget.nights)/20;
    total=(((widget.price*widget.rooms*widget.nights)-discount)+sc);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(url: widget.url,  price: widget.price, date: widget.date, name: widget.name, rating: widget.rating, location: '', room: widget.rooms, email: widget.email, availrooms: widget.availrooms, ekey: widget.ekey,room_url: widget.room_url,)));
        },
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 100,
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(16,
                kToolbarHeight +40,
                16,
                16),
            children: [
              Text("My Booking ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40,),
              BookList(price: widget.price,
                name: widget.name,
                url: widget.url,
                room: widget.rooms,
                nights: widget.nights,
                room_url: widget.room_url,

              ),
              const SizedBox(height: 20,),
            _buildDivider(),
              const SizedBox(height: 5,),
                   _buildTextTile(Icons.nights_stay, Colors.orangeAccent,
                      "No of nights","x"+widget.nights.toString()),

                  const SizedBox(height: 5,),
              _buildDivider(),
              const SizedBox(height: 5,),

                  _buildTextTile(Icons.room_preferences_sharp, Colors.orangeAccent,
                      "No of rooms","x"+widget.rooms.toString()),

              const SizedBox(height: 5,),
              _buildDivider(),

              const SizedBox(height: 80,),
              _buildDivider(),

                  _buildTextTile(Icons.money_off_outlined, Colors.orangeAccent,
                      'Discount(10%)',"-\₹"+discount.toString()), _buildTextTile(Icons.money_outlined, Colors.orangeAccent,
                  'Service Charge(5%)',"+\₹"+sc.toString()),



              const SizedBox(height: 5,),
              _buildDivider(),
              const SizedBox(height: 10,),



              const SizedBox(height: 5,),
              _buildDivider(),
              const SizedBox(height: 5,),

                  _buildTextTile(Icons.money_outlined, Colors.orangeAccent,
                      "Total","\₹"+total.toString()),
             
              const SizedBox(height: 20,),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.orangeAccent,
                textColor: Colors.white,
                child: Text("Confirm",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),),
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                onPressed: (){
                  main();
                  Firestore.instance.collection('adminpage').document().setData({'username':widget.uname,'email': widget.email,'number':widget.phone,'date': widget.date,'nights':widget.nights,'rooms':widget.rooms,'name':widget.name});
                  Firestore.instance.collection('hotels').document(widget.ekey).updateData({'availrooms': widget.availrooms-widget.rooms});
                      Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) => ConfirmPage(
                        name: widget.name, date: widget.date, price: total.toInt(), url:widget.url,rooms: widget.rooms, rating: widget.rating, email: widget.email, nights: widget.nights, uname: widget.uname,
                      )));
                },

              ),

            ],
          )
        ],
      ),
    );
  }

  Container _buildDivider(){
  return Container(
  height: 2,
  width: double.maxFinite,
  decoration: BoxDecoration(
  color: Colors.grey.shade300,
  borderRadius: BorderRadius.circular(5),
  ));

}
}
class BookList extends StatefulWidget {
  late final String name,url;
  final int price;
  final int room;
  final int nights;
  final String room_url;
  BookList({required this.url,required this.name,required this.price,required this.room,required this.nights,required this.room_url});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {


  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(widget.url, fit: BoxFit.cover,),

                  ),
                  const SizedBox(width: 20,),

                   Expanded(
                     child: Container(
                       width: 100,
                       child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(widget.name, style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,


                            ),),
                            // const SizedBox(height: 5,),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.grey,
                            //       width: 1,
                            //
                            //     ),
                            //     borderRadius: BorderRadius.circular(10),
                            //
                            //   ),
                            //   height: 40,
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       IconButton(
                            //         iconSize: 14,
                            //         padding: const EdgeInsets.all(4),
                            //         icon: Icon(Icons.minimize),
                            //         onPressed: () {
                            //           if (noOfRooms < 0) {
                            //             Text("Cannot be less than zero");
                            //           }
                            //           else
                            //             setState(() {
                            //               noOfRooms--;
                            //             });
                            //         },
                            //       ),
                            //       Text(noOfRooms.toString()),
                            //       IconButton(
                            //         iconSize: 14,
                            //         padding: const EdgeInsets.all(4),
                            //         icon: Icon(Icons.add),
                            //         onPressed: () {
                            //           setState(() {
                            //             noOfRooms++;
                            //           });
                            //
                            //           // Text(noOfRooms.toString());
                            //
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                     ),
                   ),


                  const SizedBox(width: 10,),
                  Text("\₹"+((widget.price) * (widget.room) * (widget.nights)).toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
@override
  Widget _buildTextTile(IconData icon, Color color, String title,String text) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500),),
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
      trailing: Text(text),
    );
  }

