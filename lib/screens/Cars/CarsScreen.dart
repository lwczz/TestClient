import 'package:client_car_service_system/components/Button/RaisedButton.dart';
import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/models/Cars/classCarData.dart';
import 'package:client_car_service_system/models/Others/classBtn.dart';
import 'package:client_car_service_system/screens/Cars/AddCarScreen.dart';
import 'package:client_car_service_system/screens/Cars/CarsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List items = getDummyList();
List<classCarData> d=[];

class CarsScreen extends StatelessWidget{

  final BuildContext context;

  CarsScreen(this.context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: CarsScreenScreen(this.context),
    );
  }

}

class CarsScreenScreen extends StatefulWidget{

  final BuildContext context;

  CarsScreenScreen(this.context);

  @override
  _CarsScreenScreenState createState()=>_CarsScreenScreenState();

}

class _CarsScreenScreenState extends State<CarsScreenScreen>{


  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return new Scaffold(

      body:  SlidableListView(),

    );
  }

  Widget SlidableListView(){

    AppBarData _appBarData=new AppBarData('My Car',null);

    return Scaffold(

      appBar:AppBarTitle(_appBarData),

      body: ListView.builder(itemCount: d.length,

          itemBuilder: (context,index){

            return GestureDetector(
              onTap: () => print(items[index]),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 150.0,
                  child: Row(
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

                                image: NetworkImage("https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")

                            )
                        ),
                      ),
                      Container(

                        height: 75,
                        width: 120,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${getWidget(d)[index]["Cars_Model"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(

                                  child: Text("${getWidget(d)[index]["Cars_Model"]}",style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)
                                  ),),


                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(

                                  child: Text("${getWidget(d)[index]["PlateNumber"]}",style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 48, 48, 54)
                                  ),),

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Container(

                        child: Row(

                          children: [
                            Container(

                              height: 100,

                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    editButton(),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                      )
                    ],
                  ),
                ),
              ),

            );

          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateAndDisplaySelection(context,new AddCarScreen());


        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );



  }



  Widget editButton(){

    String add = "Edit";

    classBtn basicWidgetBtn = classBtn(add, Colors.orange, context, CarsScreen(context),100.0,40.0);

    return RaisedBtn(basicWidgetBtn);

  }

  Widget deleteButton(){

  }//Retrieve Car Data



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

List getDummyList() {

  List list = List.generate(d.length, (i) {
    return "Car ${i + 1}";
  });
  return list;

}

class passData{

  classCarData mdl =new classCarData();

  passData(this.mdl){

    d.add(mdl);
  }

}