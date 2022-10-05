import 'package:flutter/material.dart';
import 'package:presentation/style/dimens.dart';
import 'package:shimmer/shimmer.dart';

class ShadowItem extends StatelessWidget {
  const ShadowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          ShadowContainer(
            width: double.infinity,
            height: Dimens.size250,
          ),
          ShadowContainer(
            width: Dimens.size86,
            height: Dimens.size15,
          ),
          ShadowContainer(
            width: double.infinity,
            height: Dimens.size24,
            padding: Dimens.size6,
          ),
          ShadowContainer(
            width: double.infinity,
            height: Dimens.size15,
          ),
        ],
      ),
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.white,
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    required this.width,
    required this.height,
    this.borderRadius = Dimens.size8,
    this.padding = Dimens.size8,
    Key? key,
  });

  final double width;
  final double height;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Dimens.size8,
        padding,
        Dimens.size8,
        padding,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
