import 'package:flutter/material.dart';

const SendButton = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const MessageText = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const MessageInput = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xff8bbabb), width: 2.0),
  ),
);

const TextInput = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  prefixIcon: Icon(Icons.email),
);
