import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plant_home_body.dart';
import 'package:flutter_app/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantHome extends StatelessWidget {
  const PlantHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: PlantHomeBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/menu.svg',
        ),
      ),
    );
  }
}

