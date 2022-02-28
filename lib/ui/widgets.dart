import 'package:flutter/material.dart';

import '../logic/themecubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final AppBarr = AppBar(
  centerTitle: true,
  title: Text("DIAGMASTER"),
);

final FloatingActionButtonn = (context) => FloatingActionButton(onPressed: () {
      BlocProvider.of<ThemeCubit>(context).changetheme();
    });
