import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common_widgets/image_error_widget.dart';
import 'package:presentation/style/dimens.dart' as D;

class MovieCover extends StatelessWidget {
  const MovieCover({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Blur(
          blur: 2,
          colorOpacity: 0.2,
          child: SizedBox(
            width: double.infinity,
            height: D.backCover_h,
            child: MovieCoverLoader(
              imageUrl: imageUrl,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            D.frontCoverP_l,
            D.frontCoverP_t,
            D.frontCoverP_r,
            D.frontCoverP_b,
          ),
          child: MovieCoverLoader(imageUrl: imageUrl),
        )
      ],
    );
  }
}

class MovieCoverLoader extends StatelessWidget {
  const MovieCoverLoader({
    Key? key,
    required this.imageUrl,
    this.alignment = Alignment.center,
    this.fit,
  }) : super(key: key);

  final String imageUrl;
  final AlignmentGeometry alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, progress) {
        return progress == null
            ? child
            : Center(child: const CircularProgressIndicator());
      },
      fit: fit,
      alignment: alignment,
      errorBuilder: (context, exception, stackTrace) => ImageErrorWidget(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
