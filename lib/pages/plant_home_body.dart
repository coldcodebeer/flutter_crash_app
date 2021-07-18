import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plant_header_with_search_box.dart';
import 'package:flutter_app/pages/plant_title.dart';
import 'package:flutter_app/utilities/constants.dart';

class PlantHomeBody extends StatelessWidget {
  const PlantHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreButton(
            title: 'More',
            press: () {},
          ),
        ],
      ),
    );
  }
}
