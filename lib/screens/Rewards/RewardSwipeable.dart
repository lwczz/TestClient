import 'package:client_car_service_system/components/Navigation/Swipeable.dart';
import 'package:client_car_service_system/screens/Rewards/RewardScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardsHistoryScreen.dart';

import 'package:flutter/material.dart';



String appBarTitle="Reward";
String tabTitle1="Reward ";
String tabTitle2="History";

SwipeableData swipeableData= SwipeableData(appBarTitle,tabTitle1,tabTitle2,RewardScreen(),RewardsHistoryScreen());

class RewardSwipeable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swipeable(swipeableData);
  }
}



