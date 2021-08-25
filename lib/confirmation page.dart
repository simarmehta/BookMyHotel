import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latest_hotel/checkoutpage.dart';
import 'package:latest_hotel/homepage.dart';
import 'package:latest_hotel/login.dart';
import 'package:latest_hotel/provider/myprovider.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:provider/provider.dart';

class ConfirmPage extends StatefulWidget {
  String email,uname;
  final String name,url;
  final int price;
  final String date;
 late int rooms;
  final int rating;
  final int nights;
  ConfirmPage({required this.url,required this.name,required this.price,required this.date,required this.rooms,required this.rating,required this.email,required this.nights,required this.uname});

  @override
  _ConfirmPageState createState() => _ConfirmPageState(email);
}

class _ConfirmPageState extends State<ConfirmPage> {

  String email;
  var addDt = DateTime.now();
    _ConfirmPageState(this.email);


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
      ..recipients.add(email)
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Hotel Booking Confirmation'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1> Booking Confirmation</h1>\n<p> Dear ${widget.uname}.</p></p>This email is to confirm your booking on ${ DateFormat("dd-MM-yyyy").format(DateTime.parse(addDt.toString()))} for a single room with breakfast at the ${widget.name}. <p>The check-in date shall be ${widget.date} and the stay would be for  ${widget.nights} nights.<p>Further details of your booking are listed below:</p><p>Number of Rooms: ${widget.rooms} </p><p>Type: Single</p> <p>CheckIn Time: 1:00 pm</p><p>Amenities: Free WiFi, Gym, etc....</p><p>If you have any inquiries, please do not hesitate to contact the company or call the hotel directly.</p><p>We are looking forward to your visit and hope that you enjoy your stay.</p><p>Best Regards</p>The Hotel App</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  title: Text(" Email has been sent\n Please check your inbox"),
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
  late MyProvider myProvider;
  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getHotels();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(currentEmail: email,)));
        },
        ),
        title: Text("Booking Confirmed", style: TextStyle(
            color: Colors.black
        ),),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage(widget.url)
                    )
                ),
              ),
              SizedBox(height: 8,),
              Text("Thank you for choosing us!", style:TextStyle(fontSize: 20)),
              Text("\nYour room has been booked and will be ready on ${widget.date}", style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              divider(),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name",style:TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        //gradient: Gradient(),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Text(widget.name, style: TextStyle(fontSize: 14).copyWith(
                        color: Colors.grey),
                        ),
                  )
                ],
              ),
              divider(),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CheckIn Date", style:TextStyle(fontSize: 17),),
                  Text(widget.date, style: TextStyle(fontSize: 15).copyWith(
                      color: Colors.grey
                  ),),
                ],
              ),
              SizedBox(height: 2,),
              divider(),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Final Amount", style: TextStyle(fontSize: 17),),
                  Text("\₹"+widget.price.toString(), style: TextStyle(fontSize: 15).copyWith(
                      color: Colors.grey
                  ),),
                ],
              ),
              SizedBox(height: 3,),
              divider(),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Number of nights", style: TextStyle(fontSize: 17),),
                  Text(widget.nights.toString(), style: TextStyle(fontSize: 15).copyWith(
                      color: Colors.grey
                  ),),
                ],
              ),
              SizedBox(height: 3,),
              divider(),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("No of Rooms Booked", style: TextStyle(fontSize: 17),),
                  Text(widget.rooms.toString(), style: TextStyle(fontSize: 15).copyWith(
                      color: Colors.grey,
                      fontSize: 16
                  ),),
                ],
              ),
              SizedBox(height: 2,),
              divider(),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Method", style: TextStyle(fontSize: 17),),
                  Text("On Arrival (CASH/CARD)", style: TextStyle(fontSize: 15).copyWith(
                      color: Colors.grey
                  ),),
                ],
              ),
              divider(),
              SizedBox(height: 15,),
              Text("In case of cancellation please contact on 0112456733 or", style:TextStyle(fontSize: 13)),
              Text("\n  send an email to hotelapp78@gmail.com", style: TextStyle(fontSize: 13),),
              SizedBox(height: 15,),

              // Expanded(
              //   child: Container(),
              // ),
              InkWell(
                onTap:() {
                  main();
                  },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(25)
                      //gradient: gradientStyle
                  ),
                  child: Center(
                    child: Text("Send An Email", style: TextStyle(fontSize: 10).copyWith(
                        color: Colors.black,
                        fontSize: 20
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container divider()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }
}
