import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('World Time'),
                  onTap: () {
                    Navigator.pushNamed(context, '/world_time_loading');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Word Pair Generator'),
                  onTap: () {
                    Navigator.pushNamed(context, '/word_pair_generate');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text('Login Screen'),
                  onTap: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.grass),
                  title: Text('Plant App'),
                  onTap: () {
                    Navigator.pushNamed(context, '/plant_app');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
