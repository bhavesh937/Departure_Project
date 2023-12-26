import 'package:departure/Views/ch1.dart';
import 'package:departure/Views/homepage.dart';
import 'package:departure/Views/splesh.dart';
import 'package:departure/Views/versedetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/sholkchangeprovider.dart';

import 'Provider/theamprovider.dart';
import 'Views/dhome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => ShlokJsonDecodeProvider(),
        ),
        ListenableProvider<TheamProvider>(
          create: (context) => TheamProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        themeMode:
            (Provider.of<TheamProvider>(context).theamChange.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
        routes: {
          '/': (context) => Splash(),
          'home': (context) => HomePage(),
          'dhome': (context) => Dhome(),
          'c1': (context) => CH1(),
          'vd': (context) => VDetail(),
        },
      ),
    ),
  );
}
