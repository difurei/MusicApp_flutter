import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/data/statistic_post_data.dart';
import 'package:music_app/data/theory_posts/about_keys.dart';
import 'package:music_app/data/theory_posts/alto_key.dart';
import 'package:music_app/data/theory_posts/bass_key.dart';
import 'package:music_app/data/theory_posts/durations.dart';
import 'package:music_app/data/theory_posts/from_author.dart';
import 'package:music_app/data/theory_posts/notes.dart';
import 'package:music_app/data/theory_posts/octaves.dart';
import 'package:music_app/data/theory_posts/sounds.dart';
import 'package:music_app/data/theory_posts/tones.dart';
import 'package:music_app/models/screens.dart';
import 'package:music_app/models/statistic_post_model.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/main_page.dart';
import 'package:music_app/pages/practice/practice_page.dart';
import 'package:music_app/pages/statistic/statistic_page.dart';
import 'package:music_app/pages/theory/theory_categories_page.dart';
import 'package:music_app/pages/theory/theory_main_page.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/theory_posts/methronome.dart';
import 'data/theory_posts/treble_key.dart';

late Box box;

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<Statistic>(StatisticAdapter());
  box = await Hive.openBox<Statistic>("statistic");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StatisticData()),
        ChangeNotifierProvider(create: (_) => Screens()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(),
          '/home': (context) => HomePage(),
          '/theory': (context) => TheoryPage(),
          '/practise': (context) => PracticePage(),
          '/statistic': (context) => StatisticPage(),
          TheoryCategoriesPage.route: (context) => TheoryCategoriesPage(),
          //theory_post_pages_route
          FromAuthor.route: (context) => FromAuthor(),
          AboutKeys.route: (context) => AboutKeys(),
          AltoKey.route: (context) => AltoKey(),
          BassKey.route: (context) => BassKey(),
          TrebleKey.route: (context) => TrebleKey(),
          Durations.route: (context) => Durations(),
          Methronome.route: (context) => Methronome(),
          Notes.route: (context) => Notes(),
          Octaves.route: (context) => Octaves(),
          Sounds.route: (context) => Sounds(),
          Tones.route: (context) => Tones(),
        },
      ),
    ));
}
