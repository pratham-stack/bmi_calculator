import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData genderIcon;
  final String genderLabel;
  GenderCard({@required this.genderIcon,@required this.genderLabel});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            genderIcon,
            size: 70,
            color: kiconColor
        ),
        SizedBox(
          height: 10,
        ),
        Text(genderLabel,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

