import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';
import 'package:flutter_app/pages/TimeData.dart';

class ChooseLocation extends StatefulWidget {
  // const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locatons = [
    WorldTime(
      location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago',
    ),
    WorldTime(
      location: 'New York', flag: 'usa.jpg', url: 'America/New_York',
    ),
    WorldTime(
      location: 'Halifax', flag: 'usa.jpg', url: 'America/Halifax',
    ),
    WorldTime(
      location: 'London', flag: 'uk.jpg', url: 'Europe/London',
    ),
    WorldTime(
      location: 'Paris', flag: 'france.jpg', url: 'Europe/Paris',
    ),
    WorldTime(
      location: 'Dublin', flag: 'irish.jpg', url: 'Europe/Dublin',
    ),
    WorldTime(
      location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin',
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = locatons[index];
    await instance.getTime();
    Navigator.pop(context, ScreenArguments(
      instance.location,
      instance.flag,
      instance.time,
      instance.isDaytime,
    ));
  }

  @override
  void initState() {
    super.initState();
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locatons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locatons[index].location);
                  updateTime(index);
                },
                title: Text(
                  locatons[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locatons[index].flag}'
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
