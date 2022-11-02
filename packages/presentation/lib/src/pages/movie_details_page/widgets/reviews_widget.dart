import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:presentation/const/app.dart';
import 'package:presentation/src/common_widgets/image_error_widget.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_stars.dart';
import 'package:presentation/src/pages/movie_details_page/model/review_messages_ui.dart';
import 'package:presentation/src/pages/movie_details_page/widgets/review_list_item_shadow.dart';
import 'package:presentation/style/colors.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

import 'cast_and_crew.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    required this.reviews,
    required this.isLoading,
    super.key,
  });

  final List<ReviewMessageUi> reviews;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.size18),
      width: double.infinity,
      height: MediaQuery.of(context).size.height - Dimens.size250,
      child: isLoading
          ? ListView.builder(
              itemCount: AppConst.shadowMovieListLength,
              itemBuilder: (_, index) => ReviewListItemShadow(),
            )
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (_, index) => ReviewListItem(item: reviews[index]),
            ),
    );
  }
}

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({
    required this.item,
    super.key,
  });

  final ReviewMessageUi item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MessageField(
          message: item.message,
          starsCount: item.starsCount,
        ),
        AvatarWithName(
          imageUrl: item.imageUrl,
          date: item.date,
          userName: item.userName,
        )
      ],
    );
  }
}

class MessageField extends StatelessWidget {
  const MessageField({
    required this.message,
    required this.starsCount,
    super.key,
  });

  final int starsCount;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.messageBackground),
        borderRadius: BorderRadius.circular(Dimens.size10),
      ),
      padding: EdgeInsets.only(
        left: Dimens.size18,
        right: Dimens.size18,
        bottom: Dimens.size18,
      ),
      child: ExpandablePanel(
        header: MovieStars(
          fullStarsCount: starsCount,
          isBigStar: false,
        ),
        collapsed: Text(
          message,
          style: sfProSemiRegular14px70opacity,
          softWrap: true,
          maxLines: AppConst.maxDescriptionTextLines,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Text(
          message,
          style: sfProSemiRegular14px70opacity,
          softWrap: true,
        ),
        theme: ExpandableThemeData(
          hasIcon: true,
          tapBodyToCollapse: true,
        ),
      ),
    );
  }
}

class AvatarWithName extends StatelessWidget {
  const AvatarWithName({
    required this.date,
    required this.userName,
    this.imageUrl,
    super.key,
  });

  final String? imageUrl;
  final String userName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.size18),
      child: Row(
        children: [
          imageUrl != null
              ? PersonImage(imageUrl: imageUrl!)
              : ImageErrorWidget(
                  height: Dimens.size50,
                  width: Dimens.size50,
                ),
          Padding(
            padding: const EdgeInsets.only(left: Dimens.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: sfProSemiRegular14px,
                ),
                const SizedBox(height: Dimens.size6),
                Text(
                  date,
                  style: sfProSemiRegular12px50opacity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
