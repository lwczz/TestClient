
import 'package:client_car_service_system/components/Button/RaisedButton.dart';
import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/OtherComponents/TextField.dart';
import 'package:client_car_service_system/models/Others/classPickData.dart';
import 'package:client_car_service_system/models/Others/classPickDate.dart';
import 'package:client_car_service_system/models/Others/classText.dart';
import 'package:client_car_service_system/models/Others/classTextFormField.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';






class AddCarScreen extends StatefulWidget {


  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

final makeTypes = ["Hyundai","Honda", "Audi", "Ford","Proton"];
final years = ["2020","2019", "2018", "2017","2016"];
final ccTypes = ["1","1.1","1.2","1.3","1.4"];



class _AddCarScreenState extends State<AddCarScreen> {



  @override
  Widget build(BuildContext context) {

    AppBarData _appBarData=new AppBarData('Add Car',IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        //back button
        onPressed: () =>   Navigator.pop(context)
    ),);

    return Scaffold(

      appBar:AppBarTitle(_appBarData),

      body: SingleChildScrollView(

        child:Column(

          children: <Widget>[

              SizedBox(height: 15,),

            Center(

              child:  Text('Tell Us a bit more about your vehicle.',style: TextStyle(fontSize: 21),),

            ),

            Form(

              child: Container(

                margin: EdgeInsets.all(20.0),

                child: Column(

                  children: <Widget>[

                    carPlateNumber(),

                    SizedBox(height: 20,),

                    selectMakeDropDown(),

                    SizedBox(height: 20,),

                    carModel(),

                    SizedBox(height: 20,),

                    selectYearsDropDown(),

                    SizedBox(height: 20,),

                    selectCCDropDown(),

                    SizedBox(height: 20,),

                    continueButton(),

                  ],

                ),

              ),

            ),

          ],

        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  var currentMakeSelectedValue;
  var currentYearsSelectedValue;
  var currentCCSelectedValue;


  Widget selectMakeDropDown(){



    return Container(

      child: FormField<String>(
        builder: (FormFieldState<String> state){
          return InputDecorator(

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
                prefixIcon: Icon(Icons.branding_watermark)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Make"),
                value:currentMakeSelectedValue,
                isDense: true,
                onChanged: (newValue){
                  setState(() {
                    currentMakeSelectedValue=newValue;
                  });
                },
                items: makeTypes.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );

  }

  Widget selectYearsDropDown(){

    return Container(

      child: FormField<String>(
        builder: (FormFieldState<String> state){
          return InputDecorator(

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
                prefixIcon: Icon(Icons.date_range)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Year"),
                value:currentYearsSelectedValue,
                isDense: true,
                onChanged: (newValue){
                  setState(() {
                    currentYearsSelectedValue=newValue;
                  });
                },
                items: years.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );

  }

  Widget selectCCDropDown(){



    return Container(


      child: FormField<String>(
        builder: (FormFieldState<String> state){
          return InputDecorator(

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
                prefixIcon: Icon(Icons.cached)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select CC"),
                value:currentCCSelectedValue,
                isDense: true,
                onChanged: (newValue){
                  setState(() {
                    currentCCSelectedValue=newValue;
                  });
                },
                items: ccTypes.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );

  }

  Widget carBrand(){
    String labelText="Car Brand";
    String hintText="Car Brand";
    classTextFormField basicWidgetTxt = classTextFormField(labelText,hintText,FontAwesomeIcons.codeBranch);
    return TxtFormField(basicWidgetTxt);
  }

  Widget carModel(){

    String labelText="Car Model";
    String hintText="Car Model";
    classTextFormField basicWidgetTxt = classTextFormField(labelText,hintText,FontAwesomeIcons.tag);
    return TxtFormField(basicWidgetTxt);

  }
  Widget carPlateNumber(){

    String labelText="Plate Number";
    String hintText="ABC 9999";
    classTextFormField basicWidgetTxt = classTextFormField(labelText,hintText,FontAwesomeIcons.idCard);
    return TxtFormField(basicWidgetTxt);

  }

  Widget carYear(){
    var dataColumn=[0];
    classPickDate basicWidgetBtnPick=new  classPickDate(context,dataColumn);
    return PickupDateBtn(basicWidgetBtnPick);
  }

  Widget carCC(){
    var dataColumn=[0];
    classPickDate basicWidgetBtnPickDate=new classPickDate(context,dataColumn);
    return PickupDateBtn(basicWidgetBtnPickDate);
  }

  Widget carSeatCapacity(){
    var pickerData='';
    classPickData basicWidgetBtnPickData=new classPickData(context,pickerData);
    return PickUpDataButton(basicWidgetBtnPickData);
  }

  Widget carColour(){

    String labelText="Colour";
    String hintText="Colour";
    classTextFormField basicWidgetTxt = classTextFormField(labelText,hintText,Icons.color_lens);
    return TxtFormField(basicWidgetTxt);

  }

  Widget carTranmission(){

    var pickerData='';
    classPickData basicWidgetBtnPickData=new classPickData(context,pickerData);
    return PickUpDataButton(basicWidgetBtnPickData);

  }

  Widget carRoadTaxExpiry(){

    var dataColumn=[0,1,2];
    classPickDate basicWidgetBtnPick=new classPickDate(context,dataColumn);
    return PickupDateBtn(basicWidgetBtnPick);

  }

  Widget carInsuranceExpiry(){

    var dataColumn=[0,1,2];
    classPickDate basicWidgetBtnPick=new classPickDate(context,dataColumn);
    return PickupDateBtn(basicWidgetBtnPick);

  }

  Widget continueButton(){

    return ButtonTheme(

      minWidth: 500.0,
      height: 50.0,

      child: RaisedButton(

        textColor: Colors.white,
        color:Colors.orange,
        splashColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
        ),
        child: Text('Continue'),
        onPressed: () {


        },

      ),
    );

  }

}
