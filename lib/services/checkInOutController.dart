import 'package:hrapp/services/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckInOutController {

  static String clearData = 'http://13.90.214.197:8081/hrback/public/api/push_clear_today?employee_id=1';
  static String getTodayInOut = 'http://13.90.214.197:8081/hrback/public/api/push_get_today?employee_id=1';
  static String leave = 'http://13.90.214.197:8081/hrback/public/api/pushout';
  static String enter = 'http://13.90.214.197:8081/hrback/public/api/pushin';

  static String todayArrivalDate = "";
  static String todayArrivalTime = "";
  static String todayLeaveDate = "";
  static String todayLeaveTime = "";

  Future<dynamic> getInOutDateTime() async {
    NetworkHelper networkHelper = NetworkHelper();
    var data = await networkHelper.getData();

    todayArrivalTime = data[0]['time'];
    todayArrivalDate = data[0]['day'];

    todayLeaveTime = data[1]['time'];
    todayLeaveDate = data[1]['day'];
    return data;
  }

  Future<dynamic> deleteDateTime() async {
    //NetworkHelper networkHelper = NetworkHelper();

  }

  Future<dynamic> enterDateTime() async {
    NetworkHelper networkHelper = NetworkHelper();
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> leaveDateTime() async {
    NetworkHelper networkHelper = NetworkHelper();
    var data = await networkHelper.getData();
    return data;
  }

}