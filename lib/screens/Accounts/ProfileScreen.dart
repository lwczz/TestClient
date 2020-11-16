import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/models/Accounts/classAccountData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grouped_list/grouped_list.dart';

List _elements = [

  {'name': 'Full Name \n${getWidget1(d)[0]["Peoples_Name"]}', 'group': 'Account'},
  {'name': 'IC Number \n${getWidget1(d)[0]["Customers_Id"]}', 'group': 'Account'},
  {'name': 'Email \n${getWidget1(d)[0]["Customers_Id"]} ', 'group': 'Account'},
  {'name': 'Contact Number', 'group': 'Account'},
  {'name': 'Password', 'group': 'Account'},

  {'name': 'Notification', 'group': 'Settings'},
  {'name': 'Find Us', 'group': 'Help Support'},
  {'name': 'Call Us', 'group': 'Help Support'},
  {'name': 'Share this app', 'group': 'Share'},
  {'name': 'Rate this App', 'group': 'Share'},

];

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AppBarData _appBarData=new AppBarData('Profile',null);

    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBarTitle(_appBarData),
          body: Stack(

            children: <Widget>[

              GroupedListView<dynamic, String>(


                elements: _elements,
                groupBy: (elements) => elements['group'],
                groupComparator: (value1, value2) => value1.compareTo(value1),



                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                ),

                itemBuilder: (c, elements) {

                  return Card(


                    child: Container(
                      child: ListTile(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),

                        title: Text(elements['name']),
                        onTap: () {
                          if(elements["name"].toString()=="FULL NAME"){
                            Fluttertoast.showToast(
                                msg: ""+elements["FULL NAME"].toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }else if (elements["name"].toString()=="EMAIL"){
                            Fluttertoast.showToast(
                                msg: "EMAIL",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }


                        },
                      ),
                    ),
                  );
                },

              ),
        ButtonTheme(

          minWidth:300,
          height: 50,

          child: RaisedButton(

            textColor: Colors.white,
            color:Colors.orange,
            splashColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
            ),
            child: Text('LOGOUT'),
            onPressed: () {

            },

          ),
        ),


            ],

          ),


      ),

    );
  }
}
List<classAccountData> d=[];
List getDummyList() {

  List list = List.generate(d.length, (i) {
    return "Car ${i + 1}";
  });
  return list;

}

class passDataProfile{

  classAccountData mdl =new classAccountData();

  passDataProfile(this.mdl){

    d.add(mdl);
  }

}
