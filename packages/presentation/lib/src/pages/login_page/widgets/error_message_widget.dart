import 'package:flutter/material.dart';
import 'package:presentation/src/pages/login_page/bloc/login_bloc.dart';
import 'package:presentation/style/dimens.dart';

class ErrorMessageWidget extends StatelessWidget {
  final LoginBloc bloc;
  final String? tile;

  const ErrorMessageWidget({
    required this.bloc,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    if (tile == null || tile!.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.size20),
      child: Text(
        tile ?? '',
        style: const TextStyle(
          fontSize: Dimens.size18,
          color: Colors.red,
        ),
      ),
    );
  }
}