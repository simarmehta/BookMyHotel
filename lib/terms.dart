import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latest_hotel/homepage.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: () {
    Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (BuildContext context) => HomePage(currentEmail: '',)));
    },),
    elevation: 0.0,
    backgroundColor: Colors.orangeAccent,

    title:Text("Terms and Conditions Page")
        ),

      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text(" Accommodation has engaged the company \nto provide you a single source for your travel service needs.\n\nThese terms and conditions govern your use of these travel services provided by Hotel Accommodation and this app.\n\nThis App,is intended for personal, noncommercial use. This Agreement describes the terms and conditions applicable to the services available through this app.\n\n This Agreement describes your responsibilities and, among other things, limits the liability of Hotel Accommodations. \n\nBEFORE SUBMITTING AN ACCOUNT REGISTRATION FORM AND/OR USING ANY OF THESE SERVICES,PLEASE READ ALL OF THIS AGREEMENT CAREFULLY.\n\n BY ACCESSING ANY AREAS OF THIS SITE, USERS ('USERS' OR 'YOU') AGREE TO BE LEGALLY BOUND WITHOUT LIMITATION, QUALIFICATION OR CHANGE AND TO ABIDE BY THESE TERMS AND CONDITIONS, WHICH WILL CONSTITUTE OUR AGREEMENT('AGREEMENT'). \n\nIf at any time you do not agree with any part of this Agreement, YOU MUST DISCONTINUE USE OF THIS APP. The company reserves the right, in its sole discretion, to amend, modify or alter this Agreement at any time by posting the amended terms on this App.\n\nWe recommend that you review these terms and conditions periodically. The amended terms shall be effective from and after the date that they are posted on the Site. This Agreement may not otherwise be amended except in writing signed by both parties.Company incorporates herein, by reference, its Privacy Policy",
          textAlign: TextAlign.left,
          style: TextStyle(

              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey

          ),),
        ),
      ),


    );

  }
}
