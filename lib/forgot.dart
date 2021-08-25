import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latest_hotel/login.dart';
 
class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {

  var formKey=GlobalKey<FormState>();
  late String email;

  Future<void> resetPassword() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:IconButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(
                builder:(BuildContext context)=>Login()));
            //=>moveTo(context),
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
        ),
        title: Text("Password Reset ",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.orangeAccent,
      ),

      body: Center(
            child: Padding(padding: EdgeInsets.only(top: 50),
            child:Form(
              key: formKey,
            child:Column(

              children: [
                SizedBox(height: 40,),
                Text("A link will be sent to your email",
                style: TextStyle(color: Colors.black,fontSize: 20),
                ),
               SizedBox(height: 3,),
                Text("Please click on it to reset your password",
                  style: TextStyle(color: Colors.black,fontSize: 20),
                ),
                Theme(
                  data: ThemeData(
                      hintColor: Colors.black
                  ),
                  child:Padding(padding: EdgeInsets.only(top:30),
                    child: TextFormField(
                      validator:
                        (value){
                    if (value!.isEmpty) {
                    return "Please Enter an email";
                    }

                    else {
                    email = value;
                    }
                    return null;
                    },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black,width: 1)
                        ),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black,width: 1)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black,width: 1)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.black,width: 1)
                        ),
                      ),
                    ) ,
                  ),

                ),
              Padding(
              padding: EdgeInsets.only(top: 20,left: 30,right: 30),
                child:RaisedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    resetPassword();
                  }
                },


                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),

                  ),
                color:Colors.orangeAccent ,
                  child:Text("Send Email",
                  style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 22
                  ),
                ),
                padding: EdgeInsets.all(20),
                  )
                  ),
                ],),
              )
            )
      )
    );

  }
}
