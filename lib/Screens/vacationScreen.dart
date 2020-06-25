import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/Components/borderSide.dart';
import 'package:hrapp/Components/menu.dart';
import 'package:hrapp/Components/roundedBtn.dart';
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
  int selectedIndex = 2;
  NetworkHelper networkHelper = NetworkHelper();
  List requestsTypes;
  String _requestType;
  DateTime _selectedDateFrom;
  DateTime _selectedDateTo;
  String dateFrom = 'من يوم', dateFromM, dateFromD;
  String dateTo = 'الى يوم', dateToM, dateToD;
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('طلب اجازة'),
        leading: Menu(),
      ),
      body: Container(
        height: SizeConfig.safeBlockVertical * 100,
        width: SizeConfig.safeBlockHorizontal * 100,
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
                      fontSize: SizeConfig.safeBlockHorizontal*7,
                    ),
                    hint: Text('نوع الاجازة'),
                    onChanged: (String newValue) {
                      setState(() {
                        _requestType = newValue;
                        print(_requestType);
                      });
                    },
                    items: requestsTypes?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['ar_name']),
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
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal,
                      ),
                      Text(
                        dateFrom,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal*4,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),

                      ),
                      Icon(
                        Icons.calendar_today,
                        textDirection: TextDirection.rtl,
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
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal,
                      ),
                      Text(
                        dateTo,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal*4,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.calendar_today,
                        textDirection: TextDirection.rtl,
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
              title: 'تقديم الطلب',
              onPressed: () async {
                _request.employee_id = '1';
                _request.request_type_id = _requestType;
                _request.from_date = dateFrom;
                _request.to_date = dateTo;
                _request.to_dep_id = '14';
                _request.notes = notes;

                await networkHelper.sendRequest(_request);
                //await sendRequest();
                print('Done');
              },
            ),
          ],
        ),
      ),
    );
  }
}
