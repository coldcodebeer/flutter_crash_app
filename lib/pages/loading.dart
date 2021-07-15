import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';
import 'package:flutter_app/pages/TimeData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  
  void setupWorldTime () async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'uk.jpg', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: ScreenArguments(
      instance.location,
      instance.flag,
      instance.time,
      instance.isDaytime,
    ));
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
