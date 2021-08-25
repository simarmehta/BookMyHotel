import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latest_hotel/Splash.dart';
import 'package:latest_hotel/adminlogin.dart';
import 'package:latest_hotel/adminpage.dart';
import 'package:latest_hotel/forgot.dart';
import 'package:latest_hotel/homepage.dart';
import 'package:latest_hotel/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool signInState=false;
  String email="",password="";
 String? _error;
  var _formKey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;

  Future<void> logIn() async {
    try {
      await auth.signInWithEmailAndPassword
        (email: email.trim(), password: password).then((value) {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => HomePage(currentEmail: email,)));
      });
    } on AuthException catch (error) {
      print("error");
      Fluttertoast.showToast(msg: error.message,gravity: ToastGravity.CENTER);
       }
  }





  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => SplashScreen()));
        },),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
      autovalidate: true,
      child: ListView(
        children: [
          showAlert(),
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.orangeAccent,
            child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text("Log in",
                style:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                ),
                ),
            Text("WELCOME TO THE APP",
              style:TextStyle(
                color: Colors.white,
              ),
            )],
            ),

          ),

            // color: Color(0xffff2fc3)
      ),
      Theme(
      data: ThemeData(
        hintColor: Colors.black
      ),
      child:Padding(padding: EdgeInsets.only(top:50,right: 20,left: 20 ),
        child: TextFormField(
          validator:
          (value){
            if (value!.isEmpty) {
              return "Please Enter an email";
            }
             else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
               {
                return"invalid email";
               }

            else {
              email = value;
            }
            return null;
          },
        style: TextStyle(color: Colors.orangeAccent),
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color:Colors.orangeAccent,width: 1)
          ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
          ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
          ),
        ),
      ) ,

      ),
      ),
          Theme(
            data: ThemeData(
                hintColor: Colors.black
            ),
            child:Padding(padding: EdgeInsets.only(top:50,right: 20,left: 20 ),
              child: TextFormField(
                obscureText: true,
                autocorrect: false,
                onChanged: (text){
                  password=text;
                },

                validator: (value){
                  if(value!.isEmpty){
                    return"Please Enter your password";
                  }
                  else if(value.length<6){
                    return "Password is too short";

                  }
                  else {
                    password=value;
                  }

                  return null;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.orangeAccent,width: 1)
                  ),
                ),
              ) ,

            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20),
          child: Container(
            width: double.infinity,
            child: InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => ForgotPage()));
              },
            child: Text("Forgot Password ?",style: TextStyle(
              color: Colors.black
            ),
            textAlign: TextAlign.right,
            ),
          ),),),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child:RaisedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()) {
                logIn();

              }
              },


            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),

            ),
            color:Colors.orangeAccent ,
            child:Text("Log In",
              style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25
              ),
            ),
            padding: EdgeInsets.all(10),
          )
          ),
          SizedBox(height: 40,),
           Center(
            child: Column(
              children: [
                Text("Don't have an account ?",style: TextStyle(
                    fontSize: 17,
                    color: Colors.black
                ),),
                SizedBox(height: 5,),
                FlatButton(onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context)=> SignUp())
                  );
                },
                  child: Text("Sign up",style: TextStyle(
                      fontSize: 20,
                      color: Colors.orangeAccent
                  ),
                  ),
                ),
                SizedBox(height:10),
                FlatButton(onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context)=> AdminLogin())
                  );
                },
                  child: Text("Admin",style: TextStyle(
                      fontSize: 20,
                      color: Colors.orangeAccent
                  ),
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          )
        ],
      ),

    )
    );
  }
  Widget showAlert(){
    if(_error != null){
      return Container(
        color: Colors.orangeAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.only(right:8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(_error!,maxLines: 3,),
            ),
            IconButton(onPressed: (){
              setState(() {
                _error= null;
              });
            }, icon:Icon(Icons.close),
            )
          ],
        ),
      );

    }
    return SizedBox(height: 0,);
  }

}
