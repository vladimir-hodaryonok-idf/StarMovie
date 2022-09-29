import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/utils/images_container.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({
    this.height,
    this.width,
    super.key,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsImages.errorImage,
      height: height,
      width: width,
      color: Theme.of(context).colorScheme.onPrimary,
      fit: BoxFit.cover,
    );
  }
}
