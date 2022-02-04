import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  const SkeletonContainer._(
      {Key? key,
      this.width = double.infinity,
      this.height = double.infinity,
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  const SkeletonContainer.square({
    Key? key,
    double? width,
    double? height,
    EdgeInsets? margin,
  }) : this._(key: key, width: width, height: height, margin: margin);

  @override
  Widget build(BuildContext context) => SkeletonAnimation(
        gradientColor: Theme.of(context).secondaryHeaderColor,
        shimmerColor: Theme.of(context).primaryColorLight,
        curve: Curves.easeInQuad,
        child: Container(
          width: width,
          height: height,
          margin: margin,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        ),
      );
}
