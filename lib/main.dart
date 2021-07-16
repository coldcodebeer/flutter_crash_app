import 'package:flutter/material.dart';
import 'package:flutter_app/pages/choose_location.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:flutter_app/pages/word_pair_generator.dart';
import 'package:flutter_app/pages/world_time_home.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/world_time_loading': (context) {
        return Loading();
      },
      '/home': (context) => Home(),
      '/world_time': (context) => WorldTimeApp(),
      '/world_time_location': (context) => ChooseLocation(),
      '/word_pair_generate': (context) => WordPairGenerator(),
      '/login_screen': (context) => LoginScreen(),
    },
  ));
}
