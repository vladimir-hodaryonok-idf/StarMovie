import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.bloc,
    super.key,
  });

  final MovieDetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.size_70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimens.size_18,
          Dimens.size_8,
          Dimens.size_18,
          Dimens.size_16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: bloc.goBack,
              child: SvgPicture.asset(
                AssetsImages.backArrow,
                width: Dimens.size_12,
                height: Dimens.size_20_5,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimens.size_56,
                width: Dimens.size_56,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AssetsImages.ellipse,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        AssetsImages.playIcon,
                        height: Dimens.size_39,
                        width: Dimens.size_39,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              AssetsImages.shareArrow,
              width: Dimens.size_22_5,
              height: Dimens.size_21,
            ),
          ],
        ),
      ),
    );
  }
}
