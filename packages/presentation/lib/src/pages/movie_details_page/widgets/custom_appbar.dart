import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/movie_details_page/bloc/movie_details_bloc.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.bloc,
    required this.id,
    super.key,
  });

  final MovieDetailsBloc bloc;
  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.size70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Dimens.size18,
          Dimens.size8,
          Dimens.size18,
          Dimens.size16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: bloc.goBack,
              icon: SvgPicture.asset(
                AssetsImages.backArrow,
                width: Dimens.size12,
                height: Dimens.size20_5,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: Dimens.size56,
                width: Dimens.size56,
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
                        height: Dimens.size39,
                        width: Dimens.size39,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                final locale = Localizations.localeOf(context).languageCode;
                final message = S.of(context).shareString(id, locale);
                if (Platform.isAndroid || Platform.isIOS) {
                  bloc.share(message);
                }
                if (Platform.isMacOS) {
                  final renderBox = context.findRenderObject() as RenderBox?;
                  bloc.share(message, renderBox: renderBox);
                }
              },
              icon: SvgPicture.asset(
                AssetsImages.shareArrow,
                width: Dimens.size22_5,
                height: Dimens.size21,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
