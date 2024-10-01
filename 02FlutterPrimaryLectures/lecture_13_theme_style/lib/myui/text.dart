import 'package:flutter/material.dart';

TextStyle mytext() {
  return TextStyle(fontSize: 100, color: Colors.red);
}




TextStyle mytextparams({Color mycolor = Colors.blue, FontWeight weighttext= FontWeight.bold}){


  return TextStyle(fontSize: 40,color: mycolor);
}