import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/common_widgets/image_error_widget.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/movie_details_shadow.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/style/dimens.dart' as D;

const ellipsesInImageButtonCount = 3;

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({
    Key? key,
    required this.castList,
  }) : super(key: key);
  final List<CrewAndCastUi> castList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(D.padding_18),
      child: Container(
        width: double.infinity,
        height: D.castAndCrewList_h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Cast & Crew', style: sfProSemiMedium18px),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: D.textButton_h,
                    child: Text('View All', style: sfProSemiMedium14pxBlue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: castList.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.only(top: D.padding_8),
                      itemCount: castList.length,
                      itemBuilder: (context, index) {
                        return CastAndCrewItem(
                          item: castList[index],
                        );
                      },
                    )
                  : ListView.builder(
                      padding: EdgeInsets.only(top: D.padding_8),
                      itemCount: 4,
                      itemBuilder: (_, index) => MovieDetailsShadow()),
            ),
          ],
        ),
      ),
    );
  }
}

class CastAndCrewItem extends StatelessWidget {
  const CastAndCrewItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(D.padding_8),
      child: Row(
        children: [
          ImageWithName(item: item),
          ThreeEllipsesButton(),
          Expanded(
            child: Container(
              width: D.thirtyPercentsOfWidth(context),
              child: Text(
                item.role,
                style: sfProSemiMedium12px50opacity,
                maxLines: 2,
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
  const ThreeEllipsesButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(D.padding_15),
      child: Row(
        children: [
          ...List.generate(
            ellipsesInImageButtonCount,
            (index) => SvgPicture.asset(AssetsImages.ellipse),
          ),
        ],
      ),
    );
  }
}

class ImageWithName extends StatelessWidget {
  const ImageWithName({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: D.fiftyFivePercentsOfWidth(context),
      child: Row(
        children: [
          PersonImage(item: item),
          SizedBox(
            width: 12,
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
    Key? key,
    required this.item,
  }) : super(key: key);

  final CrewAndCastUi item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: D.personImage_h,
      width: D.personImage_w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(D.personImageBorder_r),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.fitWidth,
          errorBuilder: (context, exception, stackTrace) => ImageErrorWidget(
            height: D.personImage_h,
            width: D.personImage_w,
          ),
        ),
      ),
    );
  }
}
