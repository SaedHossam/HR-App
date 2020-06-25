import 'package:flutter/material.dart';
import 'package:hrapp/Components/borderSide.dart';
import 'package:hrapp/Components/menu.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/Screens/vacationSent.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Company {

  String name;

  Company(this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company('اجازة سنوية'),
      Company('اجازة شهرية'),
      Company('اجازة موسمية'),
      Company('اجازة استثنائية'),
      Company('اجازة صيفية'),
    ];
  }
}

class DropDownState extends State<DropDown> {

  String requestTypesUrl = 'http://13.90.214.197:8081/hrback/public/api/request_types';//GET
  String sendRequestUrl = 'http://13.90.214.197:8081/hrback/public/api/emp_request';//POST
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;
  DateTime _selectedDateFrom;
  DateTime _selectedDateTo;
  String dateFrom = 'من يوم',dateFromM,dateFromD;
  String dateTo = 'الى يوم',dateToM,dateToD;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      print(_selectedCompany);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('طلب اجازة'),
          centerTitle: true,
          leading: GestureDetector(onTap: () {}, child: Menu()),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35.34,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          margin: EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: KBorderSide,
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.22,0,0,0),
                    child: DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                      icon: Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.09,0,0,0),
                      child: Row(
                        children: [
                          Text(
                            dateFrom,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.2,
                          ),
                          Icon(
                            Icons.calendar_today,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    onPressed: (){
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).then((value) {
                        setState(() {
                          _selectedDateFrom = value;
                          dateFromM='${_selectedDateFrom.month >9 ?_selectedDateFrom.month :'0${_selectedDateFrom.month }'}';
                          dateFromD = '${_selectedDateFrom.day >9 ?_selectedDateFrom.day :'0${_selectedDateFrom.day }'}';
                          dateFrom = '${_selectedDateFrom.year}-$dateFromM-$dateFromD';
                          print(dateFrom);
                        });
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.09,0,0,0),
                      child: Row(
                        children: [
                          Text(
                            dateTo,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.2,
                          ),
                          Icon(
                            Icons.calendar_today,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    onPressed: (){
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030)
                      ).then((value) {
                        setState(() {
                          _selectedDateTo = value;
                          dateToM='${_selectedDateTo.month >9 ?_selectedDateFrom.month :'0${_selectedDateFrom.month }'}';
                          dateToD = '${_selectedDateTo.day >9 ?_selectedDateTo.day :'0${_selectedDateTo.day }'}';
                          dateTo = '${_selectedDateTo.year}-$dateToM-$dateToD';
                          print(dateTo);
                        });
                      });
                    },
                  ),
                ),
                RoundedButton(
                  title: 'تقديم الطلب',
                  onPressed: (){
                    Navigator.pushNamed(context, VacationSentScreen.id);
                  },
                )
              ],
            ),
          ),
        ),
    );
  }
}