import 'package:flutter/material.dart';
import 'package:flutter_app/pages/plant_detail_body.dart';

class PlantDetail extends StatelessWidget {
  const PlantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantDetailBody(),
    );
  }
}
