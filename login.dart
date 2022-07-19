import 'package:flutter/material.dart';

import 'al_page.dart';
class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final _formKeys = GlobalKey<FormState>();
  String email = '';
  String password = '';
  var loading = false;
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFD2A76A8) ,body: SingleChildScrollView(

        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Form(key: _formKeys, child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(right: 10, top: 110,bottom: 120),
                      child: Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(20),
                      child: TextFormField(style: TextStyle(color: Colors.white),
                        onChanged: (value) => email = value,
                        validator: (value) => value!.length<3 ? 'Enter more than 3 character' : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            labelText: "Username",
                            labelStyle:TextStyle(color: Colors.white),
                            hintText: "ex.AndroNady",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person,color: Colors.white,)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(style: TextStyle(color: Colors.white),
                        onChanged: (value) => password = value,
                        validator: (value) => value!.length<6 ? 'Enter More than 6  numbers' : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.vpn_key,color: Colors.white,),
                            suffixIcon: GestureDetector(onTap: () {setState(() {
                                  obsecure = !obsecure;});},

                              child: Icon(obsecure ? Icons.visibility : Icons.visibility_off,color: Colors.white,),
                            )
                        ), obscureText: obsecure,
                      ),
                    ),
                  ]
            ,)
          ),


            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 60,
                    width: 250,
                    child: RaisedButton
                      (shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                      child: loading ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.black),
                      )
                          : Text("Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      onPressed: () async {setState(() {
                        loading = true;
                      }
                      );
                        Future.delayed(Duration(seconds: 4), () {
                          setState(() {loading = false;
                          }
                          );
                        }
                        );
                        if (_formKeys.currentState!.validate()) {
                          print(email);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AlbumPage()));
                        }
                        },

                      color: Color(0xFD7FA1CC),

                    )
                )
            ),
          ],
        ),
    ),
    );
  }
}
