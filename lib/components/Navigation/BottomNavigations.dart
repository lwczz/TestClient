import 'package:client_car_service_system/components/Navigation/Swipeable.dart';
import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/screens/Accounts/ProfileScreen.dart';
import 'package:client_car_service_system/screens/Bookings/BookingHistoryScreen.dart';
import 'package:client_car_service_system/screens/Cars/CarsScreen.dart';
import 'package:client_car_service_system/screens/Homes/HomeScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardsHistoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String appBarTitle="Booking";
String tabTitle1="Reward ";
String tabTitle2="Reward History";

SwipeableData swipeableData= SwipeableData(appBarTitle,tabTitle1,tabTitle2,RewardScreen(),RewardsHistoryScreen());

class BottomNavigations extends StatefulWidget {
  @override
  _BottomNavigationsState createState() => _BottomNavigationsState();
}


class _BottomNavigationsState extends State<BottomNavigations> with SingleTickerProviderStateMixin {



  final _bottomNavigationColor = Colors.orange;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    queryCar();
    queryProfile();
    queryReward();
    queryRewardHistory();
    queryBookingHistory();
    queryWallet();
    queryBookingHistory1();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[

          HomeScreen(context),
          CarsScreen(context),
          BookingHistoryScreen(),
          ProfileScreen(),



        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,

        currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {

          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: [

          BottomNavigationBarItem(

              icon: Icon(
                FontAwesomeIcons.home,

              ),

              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              )),

          BottomNavigationBarItem(

              icon: Icon(
                FontAwesomeIcons.car,

              ),

              title: Text(
                'Car',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),

              ),

          ),

          BottomNavigationBarItem(

              icon: Icon(
                FontAwesomeIcons.calendarTimes,
              ),

              title: Text(
                'Booking',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              )),

          BottomNavigationBarItem(

              icon: Icon(
                FontAwesomeIcons.user,
              ),

              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              )),

        ],
      ),
    );
  }
}