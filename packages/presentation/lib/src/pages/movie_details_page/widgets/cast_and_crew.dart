import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/common_widgets/image_error_widget.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/movie_details_shadow.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart';

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({
    required this.castList,
    super.key,
  });

  final List<CrewAndCastUi> castList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.size_18),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).castAndCrew,
                style: sfProSemiMedium18px,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // todo implement in the next tasks
                },
                child: Container(
                  height: Dimens.size_18,
                  child: Text(
                    S.of(context).viewAll,
                    style: sfProSemiMedium14pxBlue,
                  ),
                ),
              ),
            ],
          ),
          ...castList.isNotEmpty
              ? List.generate(
                  castList.length,
                  (index) => CastAndCrewItem(
                    item: castList[index],
                  ),
                )
              : List.generate(
                  AppConst.shadowMovieListLength,
                  (index) => MovieDetailsShadow(),
                ),
        ],
      ),
    );
  }
}

class CastAndCrewItem extends StatelessWidget {
  const CastAndCrewItem({
    required this.item,
    super.key,
  });

  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    final thirtyPercentsOfWidth =
        MediaQuery.of(context).size.width.thirtyPercent;
    return Padding(
      padding: const EdgeInsets.all(Dimens.size_8),
      child: Row(
        children: [
          ImageWithName(item: item),
          ThreeEllipsesButton(),
          Expanded(
            child: Container(
              width: thirtyPercentsOfWidth,
              child: Text(
                item.role,
                style: sfProSemiMedium12px50opacity,
                maxLines: AppConst.roleMaxLines,
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ThreeEllipsesButton extends StatelessWidget {
  const ThreeEllipsesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.size_15),
      child: Row(
        children: [
          ...List.generate(
            AppConst.ellipsesInImageButtonCount,
            (index) => SvgPicture.asset(AssetsImages.ellipse),
          ),
        ],
      ),
    );
  }
}

class ImageWithName extends StatelessWidget {
  const ImageWithName({
    required this.item,
    super.key,
  });

  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    final fiftyFivePercentsOfWidth =
        MediaQuery.of(context).size.width.fiftyFivePercent;

    return Container(
      width: fiftyFivePercentsOfWidth,
      child: Row(
        children: [
          PersonImage(item: item),
          SizedBox(
            width: Dimens.size_12,
          ),
          Text(
            item.personName,
            style: sfProSemiMedium14px,
          ),
        ],
      ),
    );
  }
}

class PersonImage extends StatelessWidget {
  const PersonImage({
    required this.item,
    super.key,
  });

  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.size_50,
      width: Dimens.size_50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.size_25),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.fitWidth,
          errorBuilder: (context, exception, stackTrace) => ImageErrorWidget(
            height: Dimens.size_50,
            width: Dimens.size_50,
          ),
        ),
      ),
    );
  }
}
