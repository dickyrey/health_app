import 'package:flutter/material.dart';
import 'package:health_app/constants.dart';

class RatingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15.0,
          color: kYellowColor,
        ),
        Icon(
          Icons.star,
          size: 15.0,
          color: kYellowColor,
        ),
        Icon(
          Icons.star,
          size: 15.0,
          color: kYellowColor,
        ),
        Icon(
          Icons.star,
          size: 15.0,
          color: kYellowColor,
        ),
        Icon(
          Icons.star,
          size: 15.0,
          color: kGrey2Color,
        ),
      ],
    );
  }
}
