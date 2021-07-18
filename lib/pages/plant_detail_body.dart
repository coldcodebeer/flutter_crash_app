import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plant_detail.icons_img.dart';
import 'package:flutter_app/pages/plant_detail_bottom_btn.dart';
import 'package:flutter_app/pages/price_detail_title_price.dart';
import 'package:flutter_app/utilities/constants.dart';

class PlantDetailBody extends StatelessWidget {
  const PlantDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          PlantDetailIconsImg(size: size),
          PlantDetailTitlePrice(
            title: 'Angelica',
            price: 20,
            country: 'Russia',
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          PlantDetailBottomBtn(size: size),
        ],
      ),
    );
  }
}
