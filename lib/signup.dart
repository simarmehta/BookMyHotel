
import 'package:flutter/material.dart';
import 'package:latest_hotel/homepage.dart';
import 'package:latest_hotel/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

 class _SignUpState extends State<SignUp> {
  bool signInState = false;
  String email = "",
      password = "",username="";
  var formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> register() async {
    try {
      await auth.createUserWithEmailAndPassword
        (email: email.trim(), password: password).then((value) {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => HomePage(currentEmail: email,)));
      });;
    } on AuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formkey,
            autovalidate: true,
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.orangeAccent,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50,),
                        Text("Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35
                          ),
                        ),
                        Text("JOIN THE COMMUNITY",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),

                  ),

                  // color: Color(0xffff2fc3)
                ),
                Theme(
                  data: ThemeData(
                      hintColor: Colors.black
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your name";
                        }
                        else {
                          username=value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "FullName",
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
                      hintColor: Colors.black
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
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

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Email",
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
                      hintColor: Colors.black
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: TextFormField(
                      obscureText: true,
                      autocorrect: false,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter password";
                        } else if (value.length < 6) {
                          return "Password is too short";
                        } else
                          password = value;

                        return null;
                      },


                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Password",
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
                      onPressed: () async {
                        await register();
                        //Firestore.instance.collection('userdata').document().setData({'email': email,'username':username,'password':password,});


                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      color: Colors.orangeAccent,
                      child: Text("Sign Up",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    )
                ),
                SizedBox(height: 10,),
                Center(
                  child: Column(
                    children: [
                      Text("You already have an account ?", style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent
                      ),),
                      SizedBox(height: 5,),
                      FlatButton(onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) =>
                                Login())
                        );
                      },
                        child: Text("Log In", style: TextStyle(
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
  }

