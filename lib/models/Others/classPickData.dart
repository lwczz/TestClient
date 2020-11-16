import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

class classPickData{
  BuildContext context;
  var PickerData = '''
      [
          [
              2,
              5,
              7
              
          ]
          
      ]
          ''';
  classPickData(this.context,this.PickerData);
  showPickerArray(BuildContext context) {

    Picker(
        adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData),
          isArray: true,
        ),
        hideHeader: true,
        selecteds: [0],
        title: Text("Please Select Seat Capacity"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        cancel: FlatButton(onPressed: () {
          Navigator.pop(context);
        }, child: Icon(Icons.child_care)),
        onConfirm: (Picker picker, List value) {

          print(picker.getSelectedValues());
        }
    ).showDialog(context);
  }
}