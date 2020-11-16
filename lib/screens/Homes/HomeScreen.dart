import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/screens/Membership/MembershipScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final BuildContext context;

  HomeScreen(this.context); ///here u have to call the build Context of FirstScreen

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: HomeScreenScreen(this.context));
  }
}

class HomeScreenScreen extends StatefulWidget {
  final BuildContext context;

  HomeScreenScreen(this.context);/// and here also.

  @override
  _HomeScreenScreenState createState() => _HomeScreenScreenState();
}

class _HomeScreenScreenState extends State<HomeScreenScreen> {

  @override
  Widget build(BuildContext context) {


    AppBarData _appBarData=new AppBarData('Home',null);

    return Scaffold(

      appBar:AppBarTitle(_appBarData),


      body: SafeArea(

        child: Container(

          child: Column(

            children: <Widget>[


              Card(

                elevation: 5,
                child: Container(

                  decoration:BoxDecoration(

                    border: Border.all(
                      width: 2.0,
                      color:  Colors.white24,
                    ),
                  ),

                  child: Row(
                    children: <Widget>[

                      SizedBox(width: 10,),

                      ClipOval(

                          child: Container(

                            height: 90.0,
                            width: 90.0,

                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topLeft: Radius.circular(50),

                                ),

                                image: DecorationImage(

                                    fit: BoxFit.cover,

                                    image: AssetImage('assets/Home/Steve Harvey.png')

                                )
                            ),

                          )
                      ),

                      Container(

                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hello Steve Harvey',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                    width: 260,

                                    child: Row(
                                      children: [

                                        Icon(
                                          FontAwesomeIcons.shieldVirus,
                                          color: Colors.orange,
                                          size: 25.0,
                                        ),

                                        SizedBox(width: 10,),

                                        Text("Platinum",style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 48, 48, 54,)
                                        ),),

                                        SizedBox(width: 10,),

                                        Icon(
                                          FontAwesomeIcons.coins,
                                          color: Colors.orange,
                                          size: 25.0,
                                        ),

                                        SizedBox(width: 10,),

                                        Text("100 Point",style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 48, 48, 54)
                                        ),),


                                       new IconButton(
                                          icon: Icon(Icons.chevron_right,
                                            color: Colors.grey,
                                            size: 40.0,),
                                          onPressed: (){

                                            navigateAndDisplaySelection(context,new MembershipScreen(context));

                                          },

                                        ),

                                      ],
                                    )

                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(choices.length, (index) {
                      return Center(
                        child: ChoiceCard(choice: choices[index]),
                      );
                    }
                    )
                ),
              ),

              Container(

                width: 360,
                height: 50,

                child: RaisedButton(

                  textColor: Colors.white,
                  color:Colors.red,

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)
                  ),



                  child: Text('Emergency Breakdown',style: TextStyle(fontSize: 16),),
                  onPressed: () => launch("tel://21213123123"),

                ),

              ),


              SizedBox(height: 10,)
            ],

          ),
        ),

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



class Choice {
  const Choice({this.title, this.images});

  final String title;

  final Image images;
}

const List<Choice> choices = const [

  const Choice(title: 'On-The-Go Services', images:Image(image: AssetImage('assets/Home/on-the-go.jpg'),)),
  const Choice(title: 'Booking Services', images:Image(image: AssetImage('assets/Home/repair-car.jpg'),)),
  const Choice(title: 'Guide Services', images:Image(image: AssetImage('assets/Home/Guide Repair.png'),)),

];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return InkWell(


      onTap: () {


        showModalBottomSheet(

            context: context,
            builder: (BuildContext context) {

              return Container(
                child: _shareWidget(context),
              );

            });
      },

      child:Card(

          color: Colors.white,
          child: Container(

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2, //                   <--- border width here
              ),


              borderRadius: BorderRadius.all(
                  Radius.circular(5.0) //         <--- border radius here
              ),

            ),

            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: choice.images,
                  ),
                  Text(choice.title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                ]),
          )),
    );
  }



}

List<String> nameItems = <String>[
  'Pick Up Service', 'Drive In'
];
List<String> urlItems = <String>[
  'Home/Guide Repair.png', 'Home/Drive In.jpg'
];

Widget _shareWidget(BuildContext context) {
  return new Container(

    height: 250.0,
    child: new Column(

      children: <Widget>[
        SizedBox(height: 20,),
        new Container(height: 3, width: 50, color: Colors.grey,),

        new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),

          child: new Container(


            height: 190.0,

            child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return new Column(
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                        child: new Image.asset(
                          'assets/${urlItems[index]}', width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,)),
                    new Text(nameItems[index])
                  ],
                );
              },
              itemCount: nameItems.length,
            ),
          ),
        ),


      ],
    ),
  );





}


