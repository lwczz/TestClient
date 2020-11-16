import 'package:client_car_service_system/components/Navigation/AppBarComponents.dart';
import 'package:client_car_service_system/components/OtherComponents/RetrieveData.dart';
import 'package:client_car_service_system/models/Bookings/classBookingData.dart';
import 'package:client_car_service_system/models/Homes/classEWalletValue.dart';
import 'package:client_car_service_system/screens/Homes/TopUpScreen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'BookingHistoryScreen.dart';

double paymentTotal=3333;
List<String> abc=['Spare Part','Spare Part'];
List<classBookingData>  bookingHistoryList=[];
List<classBookingData>  bookingHistoryList1=[];

class BookingHistoryScreen extends StatefulWidget {
  @override
  State createState() {
    return _BookingHistoryScreenState();
  }
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {

    AppBarData _appBarData = new AppBarData('Booking', null);


    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.orange,



        iconTheme: new IconThemeData(
          color: Colors.white,

        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Text('Booking',

              style: TextStyle(

                  color: Colors.white

              ),

            ),

            SizedBox(width: 120,),

            Text('RM ${getWidgetEwalletValue(eWalletValueList)[0]['EWallet']}',
              style: TextStyle(

                  color: Colors.white

              ),

            ),

            IconButton(
              icon: Icon(Icons.add_circle,
                color: Colors.white,
                size: 30.0,),
              onPressed: (){

                navigateAndDisplaySelection(context,new TopUpScreen(context));

              },

            ),

          ],
        ),
      ),

      body: ExpandableTheme(
        data:
        const ExpandableThemeData(
          iconColor: Colors.orange,
          useInkWell: true,
        ),


        child:  ListView.builder(itemCount:bookingHistoryList1.length,

            itemBuilder: (context, index) {

              return ExpandableNotifier(

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(

                      elevation: 5,

                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            child: Container(

                              child: Row(
                                children: <Widget>[

                                  Container(
                                    width: 250,
                                    height: 100,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 2, 0, 0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: <Widget>[

                                          SizedBox(height: 8,),

                                          Text(
                                            "${getWidgetBooking1History1(
                                                bookingHistoryList1)[index]['Services_Name']} ",
                                            style: TextStyle(fontSize: 20),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 6, 0, 2),
                                            child: Container(

                                              child: Text(
                                                "${getWidgetBooking1History1(
                                                    bookingHistoryList1)[index]['Booking_Status']}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 48, 48, 54)
                                                ),),

                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 2),
                                            child: Container(

                                              child: Text(
                                                "${getWidgetBooking1History1(
                                                    bookingHistoryList1)[index]['Booking_Date']
                                                    .toString()
                                                    .substring(0, 16)} ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 48, 48, 54)
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
                                          width: 80,
                                          height: 50,
                                          decoration: BoxDecoration(

                                              border: Border.all(color: Colors.orange,width: 2),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Align(

                                            child: ButtonTheme(

                                              minWidth: 500.0,
                                              height: 50.0,

                                              child: RaisedButton(

                                                textColor: Colors.black,
                                                color:Colors.white,
                                                splashColor: Colors.orangeAccent,

                                                child: Text('Pay'),
                                                onPressed: () {


                                                },

                                              ),
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
                          ScrollOnExpand(
                            scrollOnExpand: true,
                            scrollOnCollapse: false,
                            child: ExpandablePanel(
                              theme: const ExpandableThemeData(
                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                tapBodyToCollapse: true,
                              ),
                              header: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Payment Details",
                                    style: Theme.of(context).textTheme.body2,
                                  )),
                              collapsed: RichText(

                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                                text: TextSpan(
                                  // Note: Styles for TextSpans must be explicitly defined.
                                  // Child text spans will inherit styles from parent
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Total ',style: TextStyle(fontWeight: FontWeight.bold),),
                                    TextSpan(text: '(incl. VAT)                                             ', ),
                                    TextSpan(text: 'RM ${paymentTotal.toStringAsFixed(2)}', style:  TextStyle(fontWeight: FontWeight.bold)),
                                  ],


                                ),
                              ),
                              expanded: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[



                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Row(

                                          children: <Widget>[

                                            Text(
                                              '${getWidgetBooking1History1(
                                                  bookingHistoryList1)[index]['SparePart_Name']}',
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                            ),

                                            SizedBox(width: 190,),
                                            Container(

                                              child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[

                                                      Text("RM 10000.00"),


                                                    ],

                                                  )
                                              ),

                                            ),


                                          ],

                                        )

                                    ),

                                  RichText(

                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,

                                    text: TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: 'Total ',style: TextStyle(fontWeight: FontWeight.bold),),
                                        TextSpan(text: '(incl. VAT)                                             ', ),
                                        TextSpan(text: 'RM ${paymentTotal.toStringAsFixed(2)}', style:  TextStyle(fontWeight: FontWeight.bold)),
                                      ],


                                    ),
                                  ),

                                ],
                              ),
                              builder: (_, collapsed, expanded) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                  child: Expandable(
                                    collapsed: collapsed,
                                    expanded: expanded,
                                    theme: const ExpandableThemeData(crossFadePoint: 0),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              );

            }),
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

List<classEwalletValue>  eWalletValueList=[];

class passDataEwallet{

  classEwalletValue eWalletValue=new classEwalletValue();



  passDataEwallet(this.eWalletValue){

    eWalletValueList.add(eWalletValue);
  }

}

class  passDataBookingHistory1{

  classBookingData bookingData =new classBookingData();

  passDataBookingHistory1(this.bookingData){

    bookingHistoryList1.add(bookingData);
  }

}

class  passDataBookingHistory{

  classBookingData bookingData =new classBookingData();

  passDataBookingHistory(this.bookingData){

    bookingHistoryList.add(bookingData);
  }

}


