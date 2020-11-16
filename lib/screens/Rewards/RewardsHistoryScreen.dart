import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/models/Rewards/Rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RewardsHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

List items = getDummyList();
class ListItemWidget extends State<SwipeList> {
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return new Scaffold(

      body:  SlidableListView(),

    );
  }


}

List getDummyList() {
  List list = List.generate(10, (i) {
    return "Reward Name ${i + 1}";
  });
  return list;
}

Widget SlidableListView(){

  return Scaffold(

    body: ListView.builder(itemCount: 2,

        itemBuilder: (context,index){

          return Slidable(
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.35,
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

                              image: NetworkImage("https://img.freepik.com/free-vector/christmas-new-year-s-day-red-gift-box-white-background-illustration_164911-157.jpg?size=626&ext=jpg")

                          )
                      ),
                    ),
                    Container(

                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${getWidgetRewardHistory(rewardHistoryList)[index]['Rewards_Name']}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 260,
                                child: Text("Point Changed: ${getWidgetRewardHistory(rewardHistoryList)[index]['Rewards_Point']}",style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)
                                ),),


                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 260,
                                child: Text("Validity : ${getWidgetRewardHistory(rewardHistoryList)[index]['Expired_Date']}",style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)
                                ),),


                              ),
                            ),

                            Padding(

                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),

                                child: Column(

                                  children: [
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.green),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      child: Text("${getWidgetRewardHistory(rewardHistoryList)[index]['Redeem_Status']}",textAlign: TextAlign.center,),
                                    ),
                                  ],
                                )
                            ),


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            secondaryActions: <Widget>[

              IconSlideAction(

                caption: '${getWidgetRewardHistory(rewardHistoryList)[index]['Redeem_Code']}',
                color: Colors.green,
                icon: Icons.code,


              ),



            ],
          );

        }),

  );
}
List<classRewardData> rewardHistoryList=[];
class  passDataRewardHistory{

  classRewardData rewardData =new classRewardData();

  passDataRewardHistory(this.rewardData){

    rewardHistoryList.add(rewardData);
  }

}