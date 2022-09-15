import 'package:flutter/material.dart';
import 'package:presentation/src/pages/movie_details_page/model/cast_and_crew.dart';
import 'package:presentation/style/text_styles/styles.dart';

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({
    Key? key,
    required this.castList,
  }) : super(key: key);
  final List<CrewAndCastUi> castList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cast & Crew',
                  style: sfProSemiMedium18px,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 18,
                    child: Text(
                      'View All',
                      style: sfProSemiMedium14pxBlue,
                    ),
                  ),
                ),
              ],
            ),
            Spacer()
            // ListView.builder(
            //   itemCount: castList.length,
            //   itemBuilder: (context, index) {
            //     return CastAndCrewItem(
            //       item: castList[index],
            //     );
            //   },
            // ),
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
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 50,
        height: 50,
        child:Row(
          children: [

          ],
        ),
      ),
    );
  }
}
