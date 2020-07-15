import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/Components/drawerList.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/networking.dart';
import 'package:hrapp/services/size_config.dart';
import '../constants.dart';
import 'package:trust_location/trust_location.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:flutter/services.dart';

class CheckInOut extends StatefulWidget {
  static const String id = 'checkIn_screen';
  @override
  _CheckInOutState createState() => _CheckInOutState();
}

class _CheckInOutState extends State<CheckInOut> {
  String _latitude;
  String _longitude;
  bool _isMockLocation;
  int selectedIndex = 4;
  //String getTodayInOut = 'http://13.90.214.197:8081/hrback/public/api/push_get_today?employee_id=1';
  String todayArrivalDate = "---";
  String todayArrivalTime = "---";
  String todayLeaveTime = "---";
  int dataLength = 0;
  NetworkHelper networkHelper = NetworkHelper();
  BorderRadius arRadius = BorderRadius.only(
      topLeft: Radius.circular(SizeConfig.safeBlockVertical * 2),
      bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 2));
  BorderRadius enRadius = BorderRadius.only(
      topRight: Radius.circular(SizeConfig.safeBlockVertical * 2),
      bottomRight: Radius.circular(SizeConfig.safeBlockVertical * 2));
  Locale myLocale;

  Future<void> getCheckInOutData() async {
    var data = await networkHelper.getData();
    if (data.length == 2) {
      dataLength = 2;
      todayArrivalTime = data[0]['time'];
      todayArrivalDate = data[0]['day'];
      todayLeaveTime = data[1]['time'];
    } else if (data.length == 1) {
      dataLength = 1;
      todayArrivalTime = data[0]['time'];
      todayArrivalDate = data[0]['day'];
    } else {
      dataLength = 1;
      todayArrivalTime = "---";
      todayArrivalDate = "---";
      todayLeaveTime = "---";
    }
    setState(() {});
  }

  // Check if location is false
  Future<void> getLocation() async {
    try {
      TrustLocation.onChange.listen((values) => setState(() {
            _latitude = values.latitude;
            _longitude = values.longitude;
            _isMockLocation = values.isMockLocation;
          }));
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }

  /// request location permission at runtime.
  void requestLocationPermission() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();
    print('permissions: $permission');
  }

  @override
  void initState() {
    getCheckInOutData();
    setState(() {});
    requestLocationPermission();
    // input seconds into parameter for getting location with repeating by timer.
    // this example set to 5 seconds.
    TrustLocation.start(5);
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);
    SizeConfig().init(context);
    return Scaffold(
      drawer: drawerList(context),
      bottomNavigationBar: bottomNavBar(0, context),
      appBar: AppBar(
        title: Text(getTranslated(context, 'check_in_out_page_title')),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockHorizontal * 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(236, 254, 252, 1),
                border: Border.all(
                  color: Color.fromRGBO(164, 241, 231, 1),
                ),
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockVertical * 100),
              ),
              child: GestureDetector(
                onTap: () async {
                  if (dataLength == 0) {
                    await networkHelper.addEnterTime();
                    dataLength++;
                    print('1st click');
                    setState(() {
                      getCheckInOutData();
                    });
                  } else if (dataLength == 1) {
                    await networkHelper.addLeaveTime();
                    dataLength++;
                    print('2nd click');
                    setState(() {
                      getCheckInOutData();
                    });
                  } else {
                    print('clicked!!');
                    setState(() {
                      getCheckInOutData();
                    });
                  }
                },
                child: Icon(
                  Icons.fingerprint,
                  size: SizeConfig.safeBlockVertical * 20,
                  color: Color.fromRGBO(110, 122, 144, 1),
                ),
              ),
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 80.0,
              height: SizeConfig.blockSizeVertical * 25.0,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockVertical * 2),
                color: Color.fromRGBO(221, 239, 237, 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius:
                          SizeConfig.safeBlockVertical * 1, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        -0.1, // horizontally
                        2.5, // Vertically
                      ))
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 78.0,
                    height: SizeConfig.blockSizeVertical * 25.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          todayArrivalDate,
                          style: KCardTextStyle.copyWith(
                              fontSize: SizeConfig.safeBlockVertical * 3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: SizeConfig.safeBlockVertical * 20,
                              height: SizeConfig.safeBlockHorizontal * 20,
                              margin:
                                  EdgeInsets.all(SizeConfig.safeBlockVertical),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockVertical * 1),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.exit_to_app,
                                        size: SizeConfig.safeBlockVertical * 6,
                                      ),
                                      Text(
                                        getTranslated(
                                            context, 'txtView2_arrival'),
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    3.5,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(71, 80, 98, 1)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    todayArrivalTime,
                                    style: KCardTextStyle.copyWith(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: SizeConfig.safeBlockVertical * 20,
                              height: SizeConfig.safeBlockHorizontal * 20,
                              margin:
                                  EdgeInsets.all(SizeConfig.safeBlockVertical),
                              //padding: EdgeInsets.all(SizeConfig.safeBlockVertical*80),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(196, 196, 196, 1),
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockVertical * 1),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.exit_to_app,
                                        size: SizeConfig.safeBlockVertical * 6,
                                      ),
                                      Text(
                                        getTranslated(
                                            context, 'txtView2_leave'),
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockVertical *
                                                    3.5,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(71, 80, 98, 1)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    todayLeaveTime,
                                    style: KCardTextStyle.copyWith(
                                        fontSize:
                                            SizeConfig.safeBlockVertical * 2.5,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 2.0,
                    height: SizeConfig.blockSizeVertical * 25.0,
                    decoration: BoxDecoration(
                      borderRadius:
                          myLocale.languageCode == 'en' ? enRadius : arRadius,
                      color: Color.fromRGBO(71, 80, 98, 1),
                    ),
                  ),
                ],
              ),
            ),
//            RoundedButton(
//              onPressed: ()async{
//                await networkHelper.clearDayData();
//                setState(() {
//                  dataLength = 0;
//                  todayArrivalTime = "---";
//                  todayArrivalDate = "---";
//                  todayLeaveTime = "---";
//                });
//              },
//              title: 'Delete All',
//            ),
//
//            Text('Mock Location: $_isMockLocation'),
//
//            Text('Latitude: $_latitude, Longitude: $_longitude'),
          ],
        ),
      ),
    );
  }
}
