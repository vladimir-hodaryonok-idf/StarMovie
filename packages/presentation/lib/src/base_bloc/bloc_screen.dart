import 'package:flutter/material.dart';
import 'package:needle_di/needle_di.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';

abstract class BlocScreenState<SW extends StatefulWidget, B extends Bloc>
    extends State<SW> {
  final B bloc = Needle.instance.get<B>();

  @override
  void initState() {
    super.initState();
    bloc.init();
    _getArgs();
  }

  void _getArgs() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = ModalRoute.of(context)?.settings;
      if (settings != null) {
        final arguments = settings.arguments;
        if (arguments is BaseArguments) {
          bloc.initArgs(arguments);
        }
      }
    });
  }
}
