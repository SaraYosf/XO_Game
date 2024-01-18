import 'package:flutter/material.dart';
import 'package:xogame/players_names.dart';

import 'xohome.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: Names.routeName,
    routes: {
      Names.routeName:(context) => Names(),
      XoHome.routeName:(context) => const XoHome(),
    },

  )
  );
}
