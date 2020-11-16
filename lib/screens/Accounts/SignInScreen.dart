import 'package:client_car_service_system/components/Navigation/BottomNavigations.dart';
import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/screens/Accounts/SignUpScreen.dart';
import 'package:client_car_service_system/screens/Accounts/Testing2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'ForgetPasswordScreen.dart';



class SignInScreen extends StatelessWidget {
  final BuildContext context;

  SignInScreen(this.context); ///here u have to call the build Context of FirstScreen

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: SignInScreenScreen(this.context));
  }
}

class SignInScreenScreen extends StatefulWidget {
  final BuildContext context;

  SignInScreenScreen(this.context);/// and here also.

  @override
  _SignInScreenScreenState createState() => _SignInScreenScreenState();
}

class _SignInScreenScreenState extends State<SignInScreenScreen> {

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();

  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      child: Column(

        children: <Widget>[

          ClipPath(

              clipper: MyClipper(),
              child:Column(
                children: <Widget>[

                  Container(

                    decoration: BoxDecoration(

                      gradient: LinearGradient(

                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.red, Colors.yellow]

                      ),

                    ),

                    padding: const EdgeInsets.only(left: 300.0,right: 100.0,top: 225,bottom: 0),
                  ),

                ],
              )

          ),

          Container(

            child: Image.asset('assets/Logo/HomePageLogo.png'),


          ),

          Container(

            margin: EdgeInsets.all(20.0),

            child: Form(

              key: formKey,

              child:Column(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                  ),

                  emailField(),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),

                  passwordField(),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),

                  forgotPassword(),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),

                  submitButton(),

                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),

                  SignUpButton(),

                ],
              ),
            ),
          )

        ],

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

  Widget emailField() {
    return TextFormField(

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

  Widget passwordField() {
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

          labelText: 'Password',
          //LabelText

          hintText: 'Abc1234',
          //HintText



          prefixIcon: Icon(Icons.lock)

      ),

    );
  }

  Widget forgotPassword(){
    return RichText(

      text: TextSpan(

        children: <TextSpan>[

          TextSpan(

              text: 'Forgot Password ?',
              style:TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  navigateAndDisplaySelection(context,new ForgotPasswordScreen(context));
                }
          ),

        ],
      ),
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
        child: Text('Sign In'),
        onPressed: () {

          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>new BottomNavigations()));
        },

      ),
    );
  }

  Widget SignUpButton() {
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
        onPressed: () {

          navigateAndDisplaySelection(context,new SignUpScreen(context));
        },

      ),
    );
  }


  navigateAndDisplaySelection(
      BuildContext context,Object _obj) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Second Screen!
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => _obj),
    );

  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path=new Path();
    path.lineTo(0, size.height / 1.75);
    var firstControlPoint = new Offset(size.width / 4, size.height / 1.75);
    var firstEndPoint = new Offset(size.width / 2, size.height / 1.75 - 60);
    var secondControlPoint =
    new Offset(size.width - (size.width / 4), size.height / 2.75 - 65);
    var secondEndPoint = new Offset(size.width, size.height / 1.75 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
