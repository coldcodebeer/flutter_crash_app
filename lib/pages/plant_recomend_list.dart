import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plant_detail.dart';
import 'package:flutter_app/utilities/constants.dart';

import '../utilities/constants.dart';
import 'plant_detail.dart';

class PlantRecomentList extends StatelessWidget {
  const PlantRecomentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PlantRecomendCard(
            image: 'assets/image_1.png',
            title: 'Samantha',
            country: 'Russia',
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetail(),
                ),
              );
            },
          ),
          PlantRecomendCard(
            image: 'assets/image_2.png',
            title: 'Angelica',
            country: 'Russia',
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetail(),
                ),
              );
            },
          ),
          PlantRecomendCard(
            image: 'assets/image_3.png',
            title: 'Samantha',
            country: 'Russia',
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetail(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PlantRecomendCard extends StatelessWidget {
  const PlantRecomendCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(
            // 'assets/dog1.jpg',
            image,
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.23),
                    offset: Offset(0, 10),
                    blurRadius: 50,
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: '$title\n'.toUpperCase(),
                      style: Theme.of(context).textTheme.button,
                    ),
                    TextSpan(
                      text: '$country'.toUpperCase(),
                      style: TextStyle(
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                  ])),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
