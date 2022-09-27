import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common_widgets/image_error_widget.dart';
import 'package:presentation/style/dimens.dart';

class MovieCover extends StatelessWidget {
  const MovieCover({
    required this.imageUrl,
    super.key,
  });

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
            height: Dimens.height_300,
            child: MovieCoverLoader(
              imageUrl: imageUrl,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            Dimens.padding_104,
            Dimens.padding_140,
            Dimens.padding_104,
            Dimens.padding_20,
          ),
          child: MovieCoverLoader(imageUrl: imageUrl),
        )
      ],
    );
  }
}

class MovieCoverLoader extends StatelessWidget {
  const MovieCoverLoader({
    required this.imageUrl,
    this.alignment = Alignment.center,
    this.fit,
    super.key,
  });

  final String imageUrl;
  final AlignmentGeometry alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (
        context,
        child,
        progress,
      ) {
        return progress == null
            ? child
            : Center(child: const CircularProgressIndicator());
      },
      fit: fit,
      alignment: alignment,
      errorBuilder: (
        context,
        exception,
        stackTrace,
      ) =>
          ImageErrorWidget(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
