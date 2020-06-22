import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/Components/menu.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/services/networking.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class CheckInOut extends StatefulWidget {

  @override
  _CheckInOutState createState() => _CheckInOutState();
}

class _CheckInOutState extends State<CheckInOut> {

  int selectedIndex = 4;
  String getTodayInOut = 'http://13.90.214.197:8081/hrback/public/api/push_get_today?employee_id=1';
  String todayArrivalDate = "---";
  String todayArrivalTime = "---";
  String todayLeaveTime = "---";
  int dataLength=0;
  NetworkHelper networkHelper = NetworkHelper();

  Future<void> test() async {
    var data = await networkHelper.getData();
    //assert(data != null);
    if(data.length == 2){
      dataLength=2;
      todayArrivalTime = data[0]['time'];
      todayArrivalDate = data[0]['day'];
      todayLeaveTime = data[1]['time'];
    }
    else if(data.length == 1){
      dataLength=1;
      todayArrivalTime = data[0]['time'];
      todayArrivalDate = data[0]['day'];
    }
    else {
      dataLength=1;
      todayArrivalTime = "---";
      todayArrivalDate = "---";
      todayLeaveTime = "---";
    }
    setState(() {});
  }

  @override
  void initState() {
    test();
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل وصول'),
        centerTitle: true,
        leading: Menu(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 254, 252,1),
                  border: Border.all(
                    color: Color.fromRGBO(164, 241, 231, 1),
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: GestureDetector(
                  onTap: () async{
                    if(dataLength == 0 ){
                      await networkHelper.addEnterTime();
                      dataLength++;
                      print('1st click');
                      setState(() {
                        test();
                      });
                    }
                    else if(dataLength == 1){
                      await networkHelper.addLeaveTime();
                      dataLength++;
                      print('2nd click');
                      setState(() {
                        test();
                      });
                    }
                    else {
                      print('clicked!!');
                      setState(() {
                        test();
                      });

                    }
                  },
                  child: Icon(
                    Icons.fingerprint,
                    size: 120.0,
                    color: Color.fromRGBO(	110, 122, 144, 1),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                width: 360.0,
                height: 182.28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(221, 239, 237, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                        offset: Offset(
                          -0.1, // horizontally
                          2.5, // Vertically
                        ))
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        todayArrivalDate,
                        style: KCardTextStyle.copyWith(fontSize: 22.32),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 1.0, right: 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                    offset: Offset(
                                      -0.1, // horizontally
                                      2.5, // Vertically
                                    ))
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'انصراف',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(
                                      Icons.exit_to_app,
                                      size: 42.0,
                                    ),
                                  ],
                                ),
                                Text(
                                    todayLeaveTime,
                                  style: KCardTextStyle,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                    offset: Offset(
                                      -0.1, // horizontally
                                      2.5, // Vertically
                                    ))
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'وصول',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Icon(
                                      Icons.exit_to_app,
                                      size: 42.0,
                                    ),
                                  ],
                                ),
                                Text(
                                  todayArrivalTime,
                                  style: KCardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              RoundedButton(
                onPressed: ()async{
                  await networkHelper.clearDayData();
                  setState(() {
                    dataLength = 0;
                    todayArrivalTime = "---";
                    todayArrivalDate = "---";
                    todayLeaveTime = "---";
                  });
                },
                title: 'Delete All',
              ),
            ],
          ),
        ),
      ),
    );
  }
}




