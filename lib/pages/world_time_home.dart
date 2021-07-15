import 'package:flutter/material.dart';
import 'package:flutter_app/pages/TimeData.dart';

class WorldTimeApp extends StatefulWidget {
  // const WorldTimeApp({Key? key}) : super(key: key);

  @override
  _WorldTimeApp createState() => _WorldTimeApp();
}

class _WorldTimeApp extends State<WorldTimeApp> {
  String location = '';
  String time = '';
  bool isDaytime = false;
  bool init = true;

  @override
  Widget build(BuildContext context) {

    if (init) {
      final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      print('build: ${args.location}');
      location = args.location;
      time = args.time;
      isDaytime = args.isDaytime;
    }

    String bgImage = isDaytime ? 'day.jpg' : 'night.jpg';
    Color bgColor = isDaytime ? Colors.lightGreen : Color(0xFF073563);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('World TIme'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  icon: Icon(
                    Icons.edit_location,
                    color: isDaytime ? Colors.black : Colors.grey[300],
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/world_time_location');
                    print('result: ${result.location}');
                    setState(() {
                      init = false;
                      location = result.location;
                      time = result.time;
                      isDaytime = result.isDaytime;
                    });
                  },
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                        color: isDaytime ? Colors.black : Colors.grey[300]
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      location,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 28,
                        color: isDaytime ? Colors.black : Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 66,
                    color: isDaytime ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
