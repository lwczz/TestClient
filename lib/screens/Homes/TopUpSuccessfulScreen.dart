


import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/Navigation/Swipeable.dart';
import 'package:client_car_service_system/screens/Homes/HomeScreen.dart';
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

class TopUpSuccessfulScreen extends StatelessWidget{

  final BuildContext context;

  TopUpSuccessfulScreen(this.context);

  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      home:TopUpSuccessfulScreenScreen(this.context),
    );

  }

}

class TopUpSuccessfulScreenScreen extends StatefulWidget{

  final BuildContext context;

  TopUpSuccessfulScreenScreen(this.context);

  @override
  State createState() => new _TopUpSuccessfulScreenState();


}

class _TopUpSuccessfulScreenState extends State<TopUpSuccessfulScreenScreen> {



  @override
  Widget build(BuildContext context) {
    return Material(

      child: Scaffold(

        body: Container(

          margin: EdgeInsets.all(15.0),

          child: Column(

            children: <Widget>[

              Icon(
                Icons.check_circle,
                color: Colors.orange,
                size: 160,
                semanticLabel: 'Text to announce in accessibility modes',
              ),

              SizedBox(height: 10,),

              Text('SUCCESS',style: TextStyle(fontSize: 30),),

              SizedBox(height: 30,),

              Text('TOTAL AMOUNT',style: TextStyle(fontSize: 12),),

              SizedBox(height: 10,),

              Text('RM 220.00',style: TextStyle(fontSize: 30),),

              SizedBox(height: 16,),





              SizedBox(height: 20,),

              Table(

                // textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: [
                  TableRow(
                      children: [
                        Text("Trans.ID",style: TextStyle(fontSize: 18),),
                        Text("2011104311171143",style: TextStyle(fontSize: 16)),

                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Add money",style: TextStyle(fontSize: 18)),
                        Text("Through: PayPal \n on 10 Nov.11:58AM",style: TextStyle(fontSize: 16)),

                      ]
                  ),

                  TableRow(

                      children: [
                        Text("Wallet",style: TextStyle(fontSize: 18)),
                        Row(

                          children: <Widget>[

                            Icon(FontAwesomeIcons.wallet,size: 16,),

                            SizedBox(width: 5,),

                            Column(

                              children: <Widget>[

                                Row(

                                  children: <Widget>[

                                    Icon(Icons.add),

                                    Text('RM 220.00',style: TextStyle(fontSize: 16))

                                  ],

                                ),

                                Text('Balance : RM240.79',style: TextStyle(fontSize: 16))

                              ],

                            )

                          ],

                        ),

                      ]
                  ),

                ],

              ),



            ],

          ),

        ),
        floatingActionButton: FloatingActionButton(

          backgroundColor: Colors.orange,
          child: Icon(Icons.home),
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(context)),);
          },
        ), // Thi
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
