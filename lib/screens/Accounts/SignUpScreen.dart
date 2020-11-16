

import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/models/Others/classSendEmail.dart';
import 'package:client_car_service_system/screens/Services/connectMySqlCRUD.dart';
import 'package:client_car_service_system/screens/Services/randomCharacter.dart';
import 'package:client_car_service_system/screens/Services/sendEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpScreen extends StatelessWidget{

  final BuildContext context;

  SignUpScreen(this.context);

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      home:SignUpScreenScreen(this.context),
    );

  }

}

class SignUpScreenScreen extends StatefulWidget{

  final BuildContext context;

  SignUpScreenScreen(this.context);

  @override
  _SignUpScreenState createState()=>_SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreenScreen>{

  final formKey = GlobalKey<FormState>();

  var _controllerEmail = new TextEditingController();
  var _controllerPassword = new TextEditingController();
  var _controllerName = new TextEditingController();
  var _controllerNRIC = new TextEditingController();
  var _controllerPhoneNumber = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    AppBarData _appBarData=new AppBarData('Sign Up',IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        //back button
        onPressed: () =>   Navigator.pop(widget.context)
    ),);

    return Scaffold(
      appBar:AppBarTitle(_appBarData),

      body:  SingleChildScrollView(

        child: Column(

          children: <Widget>[

            Container(

              margin: EdgeInsets.all(10.0),

              child: Form(

                key: formKey,

                child:Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                    ),

                    fullNameField(),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),

                    icNumberField(),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),

                    phoneNumberField(),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),

                    emailField(),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),

                    passwordField(),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),

                    confirmPasswordField(),

                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),

                    SizedBox(height: 30.0,),

                    termsAndConditions(),

                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),

                    submitButton(),

                  ],
                ),
              ),
            )

          ],

        ),

      ),

    );


  }
  Widget loginImage(){

    return Image.asset("assets/logo-1.png",
      height: 100,
      width: 200,
    );

  }

  FocusNode myFocusNode = new FocusNode();

  Widget fullNameField() {
    return TextFormField(
      controller: _controllerName,
      keyboardType: TextInputType.emailAddress,
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

          labelText: 'Full Name',
          //LabelText

          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.orange : Colors.black
          ),

          hintText: 'Full Name',
          //HintText

          prefixIcon: Icon(FontAwesomeIcons.user)
        //Icon


      ),

    );

  }

  Widget icNumberField() {
    return TextFormField(


      controller: _controllerNRIC,
      keyboardType: TextInputType.emailAddress,
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

        labelText: 'IC Number',
        //LabelText

        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Colors.orange : Colors.black
        ),

        hintText: 'xxxxxx-xx-xxxx',
        //HintText

        prefixIcon: Icon(FontAwesomeIcons.idCard),
        //Icon

      ),


    );

  }

  Widget emailField() {
    return TextFormField(

      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
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

          labelText: 'Email Address',
          //LabelText

          labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.orange : Colors.black
          ),

          hintText: 'you@example.com',
          //HintText

          prefixIcon: Icon(Icons.email)
        //Icon


      ),

    );

  }

  Widget phoneNumberField(){

    return IntlPhoneField(
      controller: _controllerPhoneNumber,
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

        labelText: 'Contact Number',
        //LabelText

        labelStyle: TextStyle(
            color: myFocusNode.hasFocus ? Colors.orange : Colors.black
        ),

        hintText: 'xxxxxxx',
        //HintText

        //Icon


      ),
      initialCountryCode: 'MY',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(

      controller: _controllerPassword,
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

          labelText: 'Password',
          //LabelText

          hintText: 'Abc1234',
          //HintText



          prefixIcon: Icon(FontAwesomeIcons.lock)

      ),

    );
  }

  Widget confirmPasswordField() {

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

          labelText: 'Confirm Password',
          //LabelText

          hintText: 'Follow Password',
          //HintText



          prefixIcon: Icon(FontAwesomeIcons.lock)

      ),

    );

  }

  Widget termsAndConditions() {

    return Text(
        'By registering, you are agreering to the YSMD Terms and Conditions, User Agreement and Privacy Policy'
    );

  }

  Widget submitButton() {
    return ButtonTheme(

      minWidth: 500.0,
      height: 50.0,

      child: RaisedButton(

          textColor: Colors.white,
          color:Colors.orange,
          splashColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
          ),
          child: Text('Sign Up'),
          onPressed:(){
            initDB();
            insert("insert into Peoples (Peoples_Id, Peoples_Name,Peoples_Image,Peoples_Password,Peoples_Email,Peoples_NRIC,Peoples_Phone_Number) values (?,?,?,?,?,?,?)",['PPL2',_controllerName.text,'',_controllerPassword.text,_controllerEmail.text,_controllerNRIC.text,_controllerPhoneNumber.text]);
            insert("insert into Customers (Customers_Id, Membership_Point,EWallet,Status,Peoples_Id) values (?,?,?,?,?)",['CSM3',2,0,0,'PPL2']);
          }

      ),
    );
  }
  _onBasicAlertPressed(context) {

    Alert(
      type: AlertType.success,
      context: context,
      title: "FLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
    ).show();

  }

}
