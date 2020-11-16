import 'package:client_car_service_system/models/Others/classTextFormField.dart';
import 'package:flutter/material.dart';

Widget TxtFormField(classTextFormField basicWidgetTxt){
  return TextFormField(
    obscureText: false,
    decoration: InputDecoration(
        border: InputBorder.none,

        enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black),

        ),

        focusedBorder: OutlineInputBorder(

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black),

        ),

        labelText: basicWidgetTxt.labelText,
        //LabelText

        hintText: basicWidgetTxt.hintText,
        //HintText

        prefixIcon: Icon(basicWidgetTxt.icons)

    ),

  );
}