import 'package:client_car_service_system/models/Accounts/classAccountData.dart';
import 'package:client_car_service_system/models/Bookings/classBookingData.dart';
import 'package:client_car_service_system/models/Cars/classCarData.dart';
import 'package:client_car_service_system/models/Homes/classEWalletValue.dart';
import 'package:client_car_service_system/models/Rewards/Rewards.dart';
import 'package:client_car_service_system/screens/Accounts/ProfileScreen.dart';
import 'package:client_car_service_system/screens/Bookings/BookingHistoryScreen.dart';
import 'package:client_car_service_system/screens/Cars/CarsScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardScreen.dart';
import 'package:client_car_service_system/screens/Rewards/RewardsHistoryScreen.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/settings.dart';
import 'package:sqljocky5/results/results.dart';




MySqlConnection conn;
init() async {
  print('配置数据库链接');
  var s = ConnectionSettings(
    user: "WC",//todo:用户名
    password: "WC123456",//todo:密码
    host: "202.186.224.125",//todo:flutter中电脑本地的ip
    port: 3306,//todo:端口
    db: "FYP_TEST",//todo:需要连接的数据库
  );
  //todo:获取数据库连接
  await MySqlConnection.connect(s).then((_){
    conn=_;
    print('连接成功');
  });



}


String querySql="";

queryProfile() async{

  querySql="SELECT * FROM Customers,Peoples Where Customers.Peoples_Id=Peoples.Peoples_Id AND Customers.Customers_Id='CSM1'";

  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classAccountData a=new classAccountData();
    a.customersId=row.byName("Customers_Id");
    a.peoplesId=row.byName("Peoples_Id");
    a.peoplesName=row.byName("Peoples_Name");
    a.peoplesPassword=row.byName("Peoples_Password");
    a.peoplesEmail=row.byName("Peoples_Email");
    a.peoplesNRIC=row.byName("Peoples_NRIC");
    a.peoplesPhoneNumber=row.byName("Peoples_Phone_Number");


    _account.add(a);
    passDataProfile(a);



  });
}
//todo:数据解析

queryBookingHistory() async{

  querySql="SELECT * FROM Customers,Booking,Booking_Detail,Services WHERE Customers.Customers_Id=Booking.Customers_Id AND Booking.Booking_Id=Booking_Detail.Booking_Id AND Booking_Detail.Services_Id=Services.Services_Id AND Booking.Customers_Id='CSM1'";

  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classBookingData bk=classBookingData();

    bk.bookingId=row.byName('Booking_Id');
    bk.bookingDate=row.byName('Booking_Date');
    bk.bookingStatus=row.byName('Booking_Status');
    bk.bookingRemarks=row.byName('Remarks');
    bk.customersId=row.byName('Customers_Id');
    bk.servicesName=row.byName("Services_Name");

    _bookingHistory.add(bk);
    passDataBookingHistory(bk);



  });
}

queryBookingHistory1() async{

  querySql="SELECT * FROM FYP_TEST.Booking,FYP_TEST.Booking_Detail,FYP_TEST.Services,FYP_TEST.Payment_Detail,FYP_TEST.Spare_Parts,FYP_TEST.Payments,FYP_TEST.Customers WHERE Booking.Booking_Id=Booking_Detail.Booking_Id AND Booking_Detail.Services_Id=Services.Services_Id AND Services.Services_Id=Payment_Detail.Services_Id AND Payment_Detail.SparePart_Id=Spare_Parts.SparePart_Id AND Payment_Detail.Payments_Id=Payments.Payments_Id AND Payments.Customers_Id=Customers.Customers_Id AND Payments.Customers_Id='CSM1'";

  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classBookingData bk=classBookingData();

    bk.bookingId=row.byName('Booking_Id');
    bk.bookingDate=row.byName('Booking_Date');
    bk.bookingStatus=row.byName('Booking_Status');
    bk.bookingRemarks=row.byName('Remarks');
    bk.customersId=row.byName('Customers_Id');
    bk.teamId=row.byName('Team_Id');
    bk.servicesId=row.byName('Services_Id');
    bk.roomId=row.byName('Room_Id');
    bk.servicesName=row.byName('Services_Name');
    bk.servicesPrice=row.byName('Services_Price');
    bk.paymentsId=row.byName('Payments_Id');
    bk.sparePartId=row.byName('SparePart_Id');
    bk.sparePartName=row.byName('SparePart_Name');
    bk.sparePartPrice=row.byName('SparePart_Price');
    bk.sparePartWarranty=row.byName('SparePart_Warranty');
    bk.paymentsMethod=row.byName('Payments_Method');
    bk.paymentAmount=row.byName('Payments_Amount');
    bk.membershipPoint=row.byName('Membership_Point');
    bk.eWallet=row.byName('EWallet');



    _bookingHistory1.add(bk);
    passDataBookingHistory1(bk);



  });
}

queryReward() async{

  querySql="SELECT * FROM Rewards";

  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classRewardData r=classRewardData();
    r.rewardsId=row.byName('Rewards_Id');
    r.rewardsName=row.byName('Rewards_Name');
    r.rewardsPoint=row.byName('Rewards_Point');
    r.rewardsBalance=row.byName('Rewards_Balance');
      _reward.add(r);
      passDataReward(r);



  });
}
//todo:数据解析

queryRewardHistory() async{

  querySql="SELECT * FROM Rewards,Reward_Detail WHERE Rewards.Rewards_Id=Reward_Detail.Rewards_Id AND Reward_Detail.Customers_Id='CSM1'";

  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classRewardData r=classRewardData();
    r.rewardsId=row.byName('Rewards_Id');
    r.rewardsName=row.byName('Rewards_Name');
    r.rewardsPoint=row.byName('Rewards_Point');
    r.rewardsBalance=row.byName('Rewards_Balance');
    r.customerId=row.byName('Customers_Id');
    r.redeemCode=row.byName('Redeem_Code');
    r.redeemDate=row.byName('Redeem_Date');
    r.redeemStatus=row.byName('Redeem_Status');
    r.expiryDate=row.byName('Expired_Date');


    _rewardHistory.add(r);
    passDataRewardHistory(r);



  });
}

queryWallet() async {

  querySql="select * from Customers where customers_Id='CSM1'";
  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
  results.forEach((row) {
    classEwalletValue ev =classEwalletValue();
    ev.customersId=row.byName('Customers_Id');
    ev.eWallet=row.byName('EWallet');
    _eWalletValue.add(ev);
    passDataEwallet(ev);

  });

}

queryCar() async{


  querySql="select * from Cars";
  Results results = await (await conn.execute( querySql)).deStream();
  print('查询成功');
  print('${results}');
    results.forEach((row) {
    classCarData m =classCarData();
    m.carId=row.byName('Cars_Id');
    m.carPlateNumber=row.byName('PlateNumber');
    m.carModel=row.byName('Cars_Model');
    m.carCC=row.byName('Cars_CC');
    m.carColour=row.byName('Cars_Colour');
    m.carTransmission=row.byName('Cars_Transmission');
    m.customersId=row.byName('Customers_Id');
    _model.add(m);
    passData(m);


  });
}
//todo:数据解析

List<classCarData> _model =[];
List<classAccountData> _account=[];
List<classRewardData> _reward=[];
List<classRewardData> _rewardHistory=[];
List<classBookingData> _bookingHistory=[];
List<classBookingData> _bookingHistory1=[];
List<classEwalletValue> _eWalletValue=[];

List   getWidget(List<classCarData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({
      'Cars_Id':'${list[i].carId}',
      'PlateNumber':'${list[i].carPlateNumber}',
      'Cars_Model':'${list[i].carModel}',
      'Cars_CC':'${list[i].carCC}',
      'Cars_Colour':'${list[i].carColour}',
      'Cars_Transmission':'${list[i].carTransmission}',
      'RoadTaxExpiry':'${list[i].carRoadTaxExpiry}',
      'Customers_Id':'${list[i].customersId}',});
  }
  return _list;
}

List   getWidget1(List<classAccountData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({
      'Customers_Id':'${list[i].customersId}',
      'Membership_Point':'${list[i].membershipPoint}',
      'EWallet':'${list[i].eWallet}',
      'Status':'${list[i].accStatus}',
      'Peoples_Id':'${list[i].peoplesId}',
      'Peoples_Name':'${list[i].peoplesName}',
      'Peoples_Password':'${list[i].peoplesPassword}',
      'Peoples_Email':'${list[i].peoplesEmail}',
      'Peoples_NRIC':'${list[i].peoplesNRIC}',
      'Peoples_Phone_Number':'${list[i].peoplesNRIC}',
     });
  }
  return _list;
}

List   getWidgetBookingHistory(List<classBookingData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({

      'Booking_Id':'${list[i].bookingId}',
      'Booking_Date':'${list[i].bookingDate}',
      'Booking_Status':'${list[i].bookingStatus}',
      'Booking_Remarks':'${list[i].bookingRemarks}',
      'Customers_Id':'${list[i].customersId}',
      'Services_Name':'${list[i].servicesName}',


    });
  }
  return _list;
}

List   getWidgetBooking1History1(List<classBookingData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({

      'Booking_Id':'${list[i].bookingId}',
      'Booking_Date':'${list[i].bookingDate}',
      'Booking_Status':'${list[i].bookingStatus}',
      'Booking_Remarks':'${list[i].bookingRemarks}',
      'Customers_Id':'${list[i].customersId}',
      'Team_Id':'${list[i].teamId}',
      'Services_Id':'${list[i].servicesId}',
      'Room_Id':'${list[i].roomId}',
      'Services_Name':'${list[i].servicesName}',
      'Services_Price':'${list[i].servicesPrice}',
      'Payments_Id':'${list[i].paymentsId}',
      'SparePart_Id':'${list[i].sparePartId}',
      'SparePart_Name':'${list[i].sparePartName}',
      'SparePart_Price':'${list[i].sparePartPrice}',
      'SparePart_Warranty':'${list[i].sparePartWarranty}',
      'Payment_Method':'${list[i].paymentsMethod}',
      'Payment_Amount':'${list[i].paymentAmount}',
      'Membership_Point':'${list[i].membershipPoint}',
      'EWallet':'${list[i].eWallet}',


    });
  }
  return _list;
}

List   getWidgetReward(List<classRewardData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({

      'Rewards_Id':'${list[i].rewardsId}',
      'Rewards_Name':'${list[i].rewardsName}',
      'Rewards_Point':'${list[i].rewardsPoint}',
      'Rewards_Balance':'${list[i].rewardsBalance}',

    });
  }
  return _list;
}

List   getWidgetRewardHistory(List<classRewardData> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({

      'Rewards_Id':'${list[i].rewardsId}',
      'Rewards_Name':'${list[i].rewardsName}',
      'Rewards_Point':'${list[i].rewardsPoint}',
      'Rewards_Balance':'${list[i].rewardsBalance}',
      'Customers_Id':'${list[i].customerId}',
      'Redeem_Code':'${list[i].redeemCode}',
      'Redeem_Date':'${list[i].redeemDate}',
      'Redeem_Status':'${list[i].redeemStatus}',
      'Expired_Date':'${list[i].expiryDate}',


    });
  }
  return _list;
}

List   getWidgetEwalletValue(List<classEwalletValue> list){

  List _list =[];
  for(int i=0;i<list.length;i++){
    _list.add({

      'Customers_Id':'${list[i].customersId}',
      'EWallet':'${list[i].eWallet}',

    });
  }
  return _list;
}




insert() async{
  await conn.prepared('insert into Customers (Customers_Id, Membership_Point,EWallet,Status,Peoples_Id) values (?, ?,?,?,?) ', ['CSM1',2,1000,0,'PPL1']).then((_){
    print('新增id${_.insertId}');

  });
}

delete() async{

  await conn.prepared('DELETE FROM Customers WHERE Customers_Id = ?', [
    'CSM1'
  ]);

}