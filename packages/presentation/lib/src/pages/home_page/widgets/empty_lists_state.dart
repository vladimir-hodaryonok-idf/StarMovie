import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/style/text_styles/styles.dart';

class EmptyListsState extends StatelessWidget {
  final HomeBloc bloc;

  const EmptyListsState({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            S.of(context).emptyData,
            style: sfProSemiBold24px,
          ),
          IconButton(
            onPressed: bloc.refreshList,
            icon: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}
