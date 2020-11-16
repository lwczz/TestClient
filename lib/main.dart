import 'package:client_car_service_system/screens/Accounts/ForgetPasswordScreen.dart';
import 'package:client_car_service_system/screens/Accounts/SignInScreen.dart';
import 'package:client_car_service_system/screens/Accounts/SignUpScreen.dart';
import 'package:client_car_service_system/screens/Accounts/Testing.dart';
import 'package:client_car_service_system/screens/Cars/AddCarScreen.dart';
import 'package:client_car_service_system/screens/Cars/CarsScreen.dart';
import 'package:client_car_service_system/screens/Cars/Data.dart';
import 'package:client_car_service_system/screens/Homes/HomeScreen.dart';
import 'package:flutter/material.dart';


void main()=> runApp(new App());



class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      title: 'Log Me In',
      home: Scaffold(

        body:SignInScreen(context),
      ),
    );
  }
}



