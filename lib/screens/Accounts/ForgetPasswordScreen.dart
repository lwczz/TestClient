

import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/models/Others/classSendEmail.dart';
import 'package:client_car_service_system/screens/Services/randomCharacter.dart';
import 'package:client_car_service_system/screens/Services/sendEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget{

  final BuildContext context;

  ForgotPasswordScreen(this.context);

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      home:ForgotPasswordScreenScreen(this.context),
    );

  }

}

class ForgotPasswordScreenScreen extends StatefulWidget{

  final BuildContext context;

  ForgotPasswordScreenScreen(this.context);

  @override
  _ForgotPasswordScreenState createState()=>_ForgotPasswordScreenState();

}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreenScreen>{
  TextEditingController _controller = new TextEditingController();
  var emailAddress;
  @override
  Widget build(BuildContext context) {

    String _title;
    AppBarData _appBarData=new AppBarData('Forget Password',IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        //back button
        onPressed: () =>   Navigator.pop(widget.context)
    ),);


    return Scaffold(

      appBar:AppBarTitle(_appBarData),

      body: SingleChildScrollView(

        child: Form(
          child: Container(

            margin: EdgeInsets.all(20.0),

            child: Column(

              children: <Widget>[

                forgotPasswordTitle(),

                Padding(
                  padding: EdgeInsets.all(10.0),
                ),

                emailField(),

                Padding(
                  padding: EdgeInsets.all(210.0),
                ),

                resetButton()

              ],
            ),
          ),

        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  Widget forgotPasswordTitle(){

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[

          TextSpan(
            text: "Please enter your email address.\n",
            style: TextStyle(color: Colors.blue,fontSize: 18),
          ),

          TextSpan(
            text: "A 4 digit verification code will be sent to this email address.",
            style: TextStyle(color: Colors.black,fontSize: 14),
          ),

        ],
      ),
    );

  }



  Widget emailField(){
    return TextFormField(

      controller: _controller,

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

          hintText: 'you@example.com',
          //HintText

          prefixIcon: Icon(Icons.email)
        //Icon

      ),

    );
  }

  Widget resetButton() {

    return ButtonTheme(

      minWidth: 500.0,
      height: 50.0,

      child: RaisedButton(

        textColor: Colors.white,
        color:Colors.orange,
        splashColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
        ),
        child: Text('Reset'),

        onPressed: () {

          setState(() {
            emailAddress=_controller;

          });
          classSendEmail _sendEmail=new classSendEmail("lwczz98@gmail.com","Forget Password","abc",randomCharacter());
          sendEmail(_sendEmail);
        },
        disabledColor: Colors.black,
      ),
    );

  }

}
