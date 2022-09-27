import 'package:flutter/material.dart';
import 'package:presentation/style/dimens.dart';
import 'package:shimmer/shimmer.dart';

class ShadowItem extends StatelessWidget {
  const ShadowItem({Key? key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          ShadowContainer(
            width: double.infinity,
            height: Dimens.height_250,
          ),
          ShadowContainer(
            width: Dimens.width_86,
            height: Dimens.height_15,
          ),
          ShadowContainer(
            width: double.infinity,
            height: Dimens.height_24,
            padding: Dimens.padding_6,
          ),
          ShadowContainer(
            width: double.infinity,
            height: Dimens.height_15,
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
    this.borderRadius = Dimens.border_r_8,
    this.padding = Dimens.padding_8,
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
        Dimens.padding_8,
        padding,
        Dimens.padding_8,
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
