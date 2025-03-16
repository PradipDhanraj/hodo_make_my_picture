import 'package:flutter/material.dart';
//import 'package:hod_makemypicture/src/utils/constants.dart';

class GridItem extends StatelessWidget {
  const GridItem({required this.image, super.key});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: Constants.dimens.paddingSmall,
      //   vertical: Constants.dimens.paddingSmall,
      // ),
      child: Image.asset(
        image,
        fit: BoxFit.fitHeight,
        height: 55,
        width: 55,
        key: ValueKey(image),
      ),
    );
  }
}
