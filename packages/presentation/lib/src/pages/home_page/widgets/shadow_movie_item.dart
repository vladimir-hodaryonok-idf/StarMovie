import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShadowItem extends StatelessWidget {
  const ShadowItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        children: [
          ShadowContainer(
            width: double.infinity,
            height: 250,
          ),
          ShadowContainer(
            width: 86,
            height: 15,
          ),
          ShadowContainer(
            width: double.infinity,
            height: 24,
            padding: 6,
          ),
          ShadowContainer(
            width: double.infinity,
            height: 15,
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
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    this.padding = 8,
  }) : super(key: key);
  final double width;
  final double height;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, padding, 8, padding),
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
