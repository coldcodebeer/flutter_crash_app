import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/constants.dart';

class PlantDetailBottomBtn extends StatelessWidget {
  const PlantDetailBottomBtn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width / 2,
          height: 84,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Text(
              'Buy Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: Container(
            height: 84,
            child: TextButton(
              onPressed: () {},
              child: Text('Description',
                  style: Theme.of(context).textTheme.subtitle2),
            ),
          ),
        ),
      ],
    );
  }
}
