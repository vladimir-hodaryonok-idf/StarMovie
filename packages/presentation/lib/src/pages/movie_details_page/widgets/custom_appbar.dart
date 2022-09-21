import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final MovieDetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.height_70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimens.padding_18,
          Dimens.padding_8,
          Dimens.padding_18,
          Dimens.padding_16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: bloc.goBack,
              child: SvgPicture.asset(
                AssetsImages.backArrow,
                width: Dimens.width_12,
                height: Dimens.height_20_5,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimens.height_56,
                width: Dimens.width_56,
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
                        height: Dimens.height_39,
                        width: Dimens.width_39,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              AssetsImages.shareArrow,
              width: Dimens.width_22_5,
              height: Dimens.height_21,
            ),
          ],
        ),
      ),
    );
  }
}
