import 'package:flutter/material.dart';

import '../../common_imports.dart';


class BottomBarImg extends StatelessWidget {

  BottomBarImg({required this.image});

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image(
        image: image,
        height: 7,
        fit: BoxFit.fill,
      ),
    );
  }
}
