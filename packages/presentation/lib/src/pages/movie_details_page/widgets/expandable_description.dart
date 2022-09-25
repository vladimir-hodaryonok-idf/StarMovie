import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/style/dimens.dart';

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
      padding: const EdgeInsets.all(Dimens.padding_18),
      child: ExpandablePanel(
        header: Text(
          S.of(context).description,
          style: sfProSemiMedium18px,
        ),
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
