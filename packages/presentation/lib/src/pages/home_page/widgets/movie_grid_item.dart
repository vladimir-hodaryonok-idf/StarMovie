import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/model/home_page_movie.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_short_info.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_stars.dart';
import 'package:presentation/utils/images_container.dart';

class MovieGridItem extends StatelessWidget {
  final HomePageMovie movie;
  final HomeBloc bloc;
  final int index;

  const MovieGridItem(
      {Key? key, required this.movie, required this.bloc, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bloc.onItemTap(index),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            buildImage(),
            MovieStars(
              fullStarsCount: movie.stars,
              isBigStar: false,
            ),
            MovieShortInfo(
              movieGenres: movie.genre,
              movieName: movie.title,
              parentsGuide: movie.certification,
            ),
          ],
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.network(
      movie.image,
      width: double.infinity,
      height: 250,
      fit: BoxFit.fitHeight,
      loadingBuilder: (context, child, progress) {
        return progress == null
            ? child
            : Center(child: const CircularProgressIndicator());
      },
      errorBuilder: (context, exception, stackTrace) => SvgPicture.asset(
        AssetsImages.errorImage,
        height: 250,
        width: double.infinity,
        color: Theme.of(context).colorScheme.onPrimary,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}