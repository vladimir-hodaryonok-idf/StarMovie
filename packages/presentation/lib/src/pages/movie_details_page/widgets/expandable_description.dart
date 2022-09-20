import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/style/dimens.dart' as D;

const maxDescriptionTextLines = 4;

class ExpandableDescription extends StatelessWidget {
  const ExpandableDescription({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(D.padding_18),
      child: ExpandablePanel(
        header: Text('Description', style: sfProSemiMedium18px),
        collapsed: Text(
          description,
          style: sfProSemiRegular14px70opacity,
          softWrap: true,
          maxLines: maxDescriptionTextLines,
          overflow: TextOverflow.ellipsis,
        ),
        expanded: Text(
          description,
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
