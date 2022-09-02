import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/base_bloc/bloc.dart';

abstract class BlocScreenState<SW extends StatefulWidget, B extends Bloc>
    extends State<SW> {
  final B bloc = GetIt.I.get<B>();

  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
