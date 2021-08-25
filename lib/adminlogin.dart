import 'package:flutter/material.dart';
import 'package:latest_hotel/adminpage.dart';
import 'package:latest_hotel/login.dart';


class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool signInState=false;
  String email="admin123@gmail.com",password="123456";
  var _formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) => Login()));
          },),
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,

          child: ListView(
            children: [
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
                      Text("Admin Log in",
                        style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 35
                        ),
                      ),
                      Text("",
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

              SizedBox(height: 50,),
              Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child:RaisedButton(
                    onPressed: (){
                      if(email!="admin123@gmail.com"){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text("Incorrect admin email"),
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
                      else if(password!="123456"){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text("Admin password is incorrect"),
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
                      else
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => AdminPage()));

                        {

                        }

                    },
                    // },


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

            ],
          ),
        )
    );
  }
}

