import 'package:GroupChat/widgets/roundedbtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constant.dart';
import 'chat.dart';

class Registration extends StatefulWidget {
  static const String id = '/registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  bool showSpiner = false,txt=true;
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100.0,
                    child: Image.asset(
                      './assets/cht.jpg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        email = value;
                      },
                      decoration:
                          TextInput.copyWith(hintText: 'Enter your email'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email Cannot Be Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      obscureText: txt,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        password = value;
                      },
                      decoration:
                            InputDecoration(
                          hintText: 'Enter your Password',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: GestureDetector(
                            dragStartBehavior: DragStartBehavior.down,
                            onTap: () {
                              setState(() {
                                txt = !txt;
                              });
                            },
                            child: Icon(
                              txt
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              semanticLabel: txt
                                  ? 'show password'
                                  : 'hide password',
                            ),
                          ),
                        ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password Cannot Be Empty';
                        }else if(password.length <= 6){
                          return 'Password too Small';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RoundedButton(
                  title: 'Register',
                  color: Colors.blue,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (email.isEmpty || password.isEmpty) {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      } else {
                        setState(() {
                          showSpiner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                          if (newUser != null) {
                            Navigator.pushReplacementNamed(context, Chat.id);
                          }

                          setState(() {
                            showSpiner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

