import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:presentation/style/text_styles/styles.dart';

class ExpandableDescription extends StatelessWidget {
  const ExpandableDescription({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ExpandablePanel(
        header: Text('Description',style: sfProSemiMedium18px),
        collapsed: Text(
          description,
          style: sfProSemiRegular14px70opacity,
          softWrap: true,
          maxLines: 4,
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
