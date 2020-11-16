import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/models/Rewards/Rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';




class RewardScreen extends StatelessWidget {
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
List<classRewardData> rewardList=[];
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
    return "screens.Reward Name ${i + 1}";
  });
  return list;
}



Widget SlidableListView(){

  return Scaffold(

    body: ListView.builder(itemCount: rewardList.length,

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
                              "${getWidgetReward(rewardList)[index]['Rewards_Name']} Point",
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 260,
                                child: Text("${getWidgetReward(rewardList)[index]['Rewards_Point']} Stock",style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)
                                ),),


                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                              child: Container(
                                width: 260,
                                child: Text("${getWidgetReward(rewardList)[index]['Rewards_Balance']}",style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 48, 48, 54)
                                ),),


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

          );

        }),

  );
}

class  passDataReward{

  classRewardData rewardData =new classRewardData();

  passDataReward(this.rewardData){

    rewardList.add(rewardData);
  }

}

