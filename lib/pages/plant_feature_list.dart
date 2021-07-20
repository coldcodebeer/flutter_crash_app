import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/constants.dart';

class PlantFeatureList extends StatelessWidget {
  const PlantFeatureList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PlantFeatureCard(
            image: 'assets/bottom_img_1.png',
            press: () {},
          ),
          PlantFeatureCard(
            image: 'assets/bottom_img_2.png',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class PlantFeatureCard extends StatelessWidget {
  const PlantFeatureCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String image;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
