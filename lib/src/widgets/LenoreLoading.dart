import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LenoreLoading extends StatelessWidget {
  final double size;
  final Color color;
  const LenoreLoading({Key? key, this.size = 15, this.color = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SpinKitFadingCube(color: color, size: size),
    );
  }
}
