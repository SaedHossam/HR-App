import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  String _clearData =
      'http://13.90.214.197:8081/hrback/public/api/push_clear_today?employee_id=1';
  String _getTodayInOut =
      'http://13.90.214.197:8081/hrback/public/api/push_get_today?employee_id=1';
  String _leave = 'http://13.90.214.197:8081/hrback/public/api/pushout?employee_id=1';
  String _enter = 'http://13.90.214.197:8081/hrback/public/api/pushin?employee_id=1';

  NetworkHelper();

  Future getData() async {
    http.Response response = await http.get(_getTodayInOut);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future clearDayData() async {
     await http.post(_clearData);
  }

  Future addEnterTime() async {
    http.Response response = await http.post(_enter);

    if (response.statusCode == 200) {
      print('added');
    } else {
      print(response.statusCode);
    }
  }

  Future addLeaveTime() async {
    http.Response response = await http.post(_leave);

    if (response.statusCode == 200) {
      print('added');
    } else {
      print(response.statusCode);
    }
  }
}
