import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

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
            height: 300,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(104, 140, 104, 20),
          child: Image.network(imageUrl),
        )
      ],
    );
  }
}
