import 'package:flutter/material.dart';
import 'package:hrapp/Components/menu.dart';

List<Company> _companies = Company.getCompanies();
List<DropdownMenuItem<Company>> _dropdownMenuItems;
Company _selectedCompany;

class VacationScreen extends StatefulWidget {
  static const String id = 'vacation_screen';
  @override
  _VacationScreenState createState() => _VacationScreenState();
}

class _VacationScreenState extends State<VacationScreen> {
  String dropdownValue = 'Ahmed';
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
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select a company"),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Selected: ${_selectedCompany.name}'),
              ],
            ),
          ),
        ));
  }
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'Apple'),
      Company(2, 'Google'),
      Company(3, 'Samsung'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }
}
