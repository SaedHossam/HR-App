import 'package:hrapp/models/newRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  String _clearData =
      'http://13.90.214.197:8081/hrback/public/api/push_clear_today?employee_id=1';
  String _getTodayInOut =
      'http://13.90.214.197:8081/hrback/public/api/push_get_today?employee_id=1';
  String _leave = 'http://13.90.214.197:8081/hrback/public/api/pushout?employee_id=1';
  String _enter = 'http://13.90.214.197:8081/hrback/public/api/pushin?employee_id=1';
  String _getRequestTypes = 'http://13.90.214.197:8081/hrback/public/api/request_types';//GET
  String _sendRequestUrl = 'http://13.90.214.197:8081/hrback/public/api/emp_request?';//POST
  NetworkHelper();

  // Check In / Out Screen
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

  // Vacation Screen
  Future getRequestsTypes() async {
    http.Response response = await http.get(_getRequestTypes);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getAllTypes() async{
    await http.get(_getRequestTypes).then((response) {
      var data = json.decode(response.body);
      return data;
    });
  }

  Future sendRequest(Request r) async{

    http.Response response = await http.post(_sendRequestUrl,body: {
      'employee_id':r.employee_id,
      'request_type_id':r.request_type_id,
      'to_dep_id':r.to_dep_id,
      'from_date':r.from_date,
      'to_date':r.to_date,
      'notes':r.notes
    });
    if (response.statusCode == 200) {
      print('Request Sent');
    } else {
      print(response.statusCode);
    }
  }
}
