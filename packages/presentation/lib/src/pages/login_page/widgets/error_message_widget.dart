import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/style/dimens.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  const ErrorMessageWidget({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.size20),
      child: Text(
        message.valueOrEmpty,
        style: const TextStyle(
          fontSize: Dimens.size18,
          color: Colors.red,
        ),
      ),
    );
  }
}