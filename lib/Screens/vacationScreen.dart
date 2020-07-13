import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/Components/borderSide.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/Components/drawerList.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/Screens/vacationSent.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/models/newRequest.dart';
import 'package:hrapp/services/networking.dart';
import 'package:hrapp/services/size_config.dart';
import 'package:http/http.dart' as http;

class VacationScreen extends StatefulWidget {
  static String id = 'Vacation_Screen';
  @override
  _VacationScreenState createState() => _VacationScreenState();
}

class _VacationScreenState extends State<VacationScreen> {
  NetworkHelper networkHelper = NetworkHelper();
  List requestsTypes;
  String _requestType;
  DateTime _selectedDateFrom;
  DateTime _selectedDateTo;
  String dateFrom , dateFromM, dateFromD;
  String dateTo , dateToM, dateToD;
  String _getRequestTypes =
      'http://13.90.214.197:8081/hrback/public/api/request_types'; //GET
  String employeeId = '1';
  String toDepartmentId = '14';
  String notes = "sample note";
  Request _request = new Request();

  // get all requests types.
  Future<void> _getAllTypes() async {
    await http.get(_getRequestTypes).then((response) {
        var data = json.decode(response.body);
        setState(() {
          requestsTypes = data;
        });
    });
  }

  @override
  void initState() {
    _getAllTypes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: bottomNavBar(2,context),
      drawer: drawerList(context),
      appBar: AppBar(
        title: Text(getTranslated(context,'vacation_request_page_title')),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal),
            child: GestureDetector(
              onTap: () {
                //TODO: Show Notifications
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: SizeConfig.safeBlockHorizontal*8,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 16,
          right: SizeConfig.safeBlockHorizontal * 16,
          top: SizeConfig.safeBlockVertical * 14,
          bottom: SizeConfig.safeBlockVertical * 14,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: KBorderSide,
              ),
              width: SizeConfig.safeBlockHorizontal * 68,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: _requestType,
                    iconSize: SizeConfig.safeBlockVertical * 5,
                    //icon: (null),
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.safeBlockHorizontal*6,
                    ),
                    hint: Text(getTranslated(context,'btn_vacation_type')),
                    onChanged: (String newValue) {
                      setState(() {
                        _requestType = newValue;
                        print(_requestType);
                      });
                    },
                    items: requestsTypes?.map((item) {
                          return new DropdownMenuItem(
                            // TODO: Language = Arabic? Arabic : English
                            child: new Text(
                                item['ar_name'],
                            ),
                            value: item['id'].toString(),
                          );
                        })?.toList() ??
                        [],
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 68,
              height: SizeConfig.safeBlockVertical*7,
              child: ButtonTheme(
                //minWidth: SizeConfig.safeBlockHorizontal*68,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        dateFrom ==null ? getTranslated(context,'btn_day_from') :dateFrom,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal*5,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal,
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030))
                        .then((value) {
                      setState(() {
                        _selectedDateFrom = value;
                        dateFromM =
                            '${_selectedDateFrom.month > 9 ? _selectedDateFrom.month : '0${_selectedDateFrom.month}'}';
                        dateFromD =
                            '${_selectedDateFrom.day > 9 ? _selectedDateFrom.day : '0${_selectedDateFrom.day}'}';
                        dateFrom =
                            '${_selectedDateFrom.year}-$dateFromM-$dateFromD';
                        print(dateFrom);
                      });
                    });
                  },
                ),
              ),
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 68,
              height: SizeConfig.safeBlockVertical*7,
              child: ButtonTheme(
                //minWidth: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_today,
                      ),
                      Text(
                        dateTo ==null ? getTranslated(context,'btn_day_to') :dateTo,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal*5,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal,
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030))
                        .then((value) {
                      setState(() {
                        _selectedDateTo = value;
                        dateToM =
                            '${_selectedDateTo.month > 9 ? _selectedDateFrom.month : '0${_selectedDateFrom.month}'}';
                        dateToD =
                            '${_selectedDateTo.day > 9 ? _selectedDateTo.day : '0${_selectedDateTo.day}'}';
                        dateTo = '${_selectedDateTo.year}-$dateToM-$dateToD';
                        print(dateTo);
                      });
                    });
                  },
                ),
              ),
            ),
            RoundedButton(
              title: getTranslated(context,'btn_submit_request'),
              onPressed: () async {
                _request.employee_id = '1';
                _request.request_type_id = _requestType;
                _request.from_date = dateFrom;
                _request.to_date = dateTo;
                _request.to_dep_id = '14';
                _request.notes = notes;

                // TODO: Check if request sent successfully.
                await networkHelper.sendRequest(_request);
                Navigator.pushNamed(context, VacationSentScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
