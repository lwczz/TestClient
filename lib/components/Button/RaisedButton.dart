import 'package:client_car_service_system/models/Others/classBtn.dart';
import 'package:client_car_service_system/models/Others/classPickData.dart';
import 'package:client_car_service_system/models/Others/classPickDate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget PickUpDataButton(classPickData basicWidgetBtnPickData){

  return RaisedButton(
    child: Text('Picker Show (Array)'),
    onPressed: () {
      basicWidgetBtnPickData.showPickerArray(basicWidgetBtnPickData.context);
    },
  );

}

Widget PickupDateBtn(classPickDate basicWidgetBtnPickDate){
  return IconButton(

    icon: Icon(FontAwesomeIcons.calendar),
    onPressed: () {
      basicWidgetBtnPickDate.showPickerDate(basicWidgetBtnPickDate.context);
    },
  );

}

Widget RaisedBtn(classBtn basicWidgetBtn) {

  return ButtonTheme(

    minWidth: basicWidgetBtn.minWidthBtn,
    height: basicWidgetBtn.heightBtn,

    child: RaisedButton(

      textColor: Colors.white,
      color:basicWidgetBtn.btnColor,
      splashColor: Colors.orangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
      ),
      child: Text(basicWidgetBtn.btnText),
      onPressed: () {
        Navigator.pushReplacement(basicWidgetBtn.context, new MaterialPageRoute(builder: (context)=>basicWidgetBtn.page));
      },

    ),
  );
}