


import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/Navigation/Swipeable.dart';
import 'package:client_car_service_system/models/Homes/classEWalletValue.dart';
import 'package:client_car_service_system/models/Payments/classTopUpData.dart';
import 'package:client_car_service_system/screens/Homes/TopUpSuccessfulScreen.dart';
import 'package:client_car_service_system/screens/Payments/PalpayScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardSwipeable.dart';
import 'package:client_car_service_system/screens/Rewards/RewardsHistoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String appBarTitle="Booking";
String tabTitle1="Reward ";
String tabTitle2="Reward History";

SwipeableData swipeableData= SwipeableData(appBarTitle,tabTitle1,tabTitle2,RewardScreen(),RewardsHistoryScreen());

class TopUpScreen extends StatelessWidget{

  final BuildContext context;

  TopUpScreen(this.context);

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      home:TopUpScreenScreen(this.context),
    );

  }

}

class TopUpScreenScreen extends StatefulWidget{

  final BuildContext context;

  TopUpScreenScreen(this.context);

  @override
  State createState() => new _TopUpScreenState();


}

class _TopUpScreenState extends State<TopUpScreenScreen> {
  TextEditingController topUpValueController=new TextEditingController();
  AppBarData _appBarData = new AppBarData('My Wallet', null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBarTitle(_appBarData),

      body:SingleChildScrollView(

        child: Column(

          children: <Widget>[


        Container(

        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10)
          ),

        ),

          child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            elevation: 5,
            child: Container(
              height: 280.0,
              child: Container(

                margin:EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(

                  children: <Widget>[

                    Row(

                      children: <Widget>[


                        Container(
                          height: 100.0,
                          width: 100.0,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)
                              ),

                              image: DecorationImage(

                                  fit: BoxFit.cover,

                                  image: NetworkImage("https://i0.wp.com/www.ecommerce-nation.com/wp-content/uploads/2018/01/paypal.png")

                              )
                          ),
                        ),


                      ],

                    ),

                    Align(

                      child: Text('RM',style: TextStyle(fontSize: 20),),
                    alignment: Alignment.centerLeft,),

                    TextField(
                      controller: topUpValueController,


                    ),

                    Align(

                      child: Text('Min. RM 20',style: TextStyle(fontSize: 14),),
                      alignment: Alignment.centerLeft,),

              SizedBox(height: 20,),

              ButtonTheme(

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

                    Navigator.push(context,MaterialPageRoute(builder: (context) => PalpayScreen()),);
                    classTopUpData _topUpValue=new classTopUpData(topUpValueController.toString());
                  },

                ),
              ),
                  ],

                ),

              )
            ),
          ),

        ),

            Container(

              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                ),

              ),

              child:  Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                elevation: 5,


                child: Container(
                    height: 110.0,


                    child: Container(

                      margin:EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(

                        children: <Widget>[
                          SizedBox(height: 25,),
                          Align(

                            child: Text('Current Balance',style: TextStyle(fontSize: 16),),
                            alignment: Alignment.centerLeft,),

                          SizedBox(height: 20,),

                          Align(

                            child: Text('RM 100.00',style: TextStyle(fontSize: 20),),
                            alignment: Alignment.centerLeft,),




                        ],

                      ),

                    )
                ),
              ),

            ),



          ],

        ),

      )





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
