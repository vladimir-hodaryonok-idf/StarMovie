import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/utils/images_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AssetsImages.backArrow,
              width: 12,
              height: 20.5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 56,
                width: 56,
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
                        height: 39,
                        width: 39,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              AssetsImages.shareArrow,
              width: 22.5,
              height: 21,
            ),
          ],
        ),
      ),
    );
  }
}
