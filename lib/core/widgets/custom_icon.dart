import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.image,
    required this.color,
    required this.padding,
    this.isColor = true,
    this.fit,
  });

  final String image;
  final Color? color;
  final double padding;
  final bool? isColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        image,
        colorFilter:
            isColor == true ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
