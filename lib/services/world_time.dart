import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  late final String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({
    this.location = '', this.time = '',
    this.flag = '', this.url = '',
    this.isDaytime = false,
  });

  Future<void> getTime() async {
    try {
      var reqUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(reqUrl);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get the time data';
    }
  }
}