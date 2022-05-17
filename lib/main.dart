import 'package:flutter/material.dart';
import 'package:sql_project_part3/Model/Journal.dart';
import 'package:sql_project_part3/Model/Newspaper.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/book_details_screen/book_detal_screen.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/journal_details_screen/journal_details_screen.dart';

import 'Model/book.dart';
import 'app_screens/hit_screen/hit_tabs_screen/newspaper_details_screen/newspaper_screen.dart';
import 'navigation_bar/nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              showUnselectedLabels: true,
              selectedItemColor: Color.fromRGBO(68, 167, 184, 1),
              unselectedItemColor: Color.fromRGBO(144, 153, 170, 1),
              unselectedLabelStyle:
                  TextStyle(color: Color.fromRGBO(144, 153, 170, 1)),
              selectedLabelStyle:
                  TextStyle(color: Color.fromRGBO(144, 153, 170, 1)),
            )),
        routes: {
          '/main_screen': (context) => NavBar(),
          '/main_screen/book_details': (context) {
            final map = ModalRoute.of(context)!.settings.arguments
                as Map<String, Object>;

            return BookDetailsScreen(
              book_id: map['book_id'] as int,
              list: map['list'] as List<Book>,
            );
          },
          '/main_screen/journal_details': (context) {
            final map = ModalRoute.of(context)!.settings.arguments
                as Map<String, Object>;

            return JournalDetailsScreen(
                journal_id: map['book_id'] as int,
                list: map['list'] as List<Journal>);
          },
          '/main_screen/newspaper_details': (context) {
            final map = ModalRoute.of(context)!.settings.arguments
                as Map<String, Object>;

            return NewspaperDetailsScreen(
              newspaper_id: map['book_id'] as int,
                list: map['list'] as List<Newspaper>);
          },
          '/main_screen/like_screen/book_details' : (context){
            final map = ModalRoute.of(context)!.settings.arguments
            as Map<String, Object>;
            return BookDetailsScreen(
              book_id: map['book_id'] as int,
              list: map['list'] as List<Book>,
            );
          },
          '/main_screen/like_screen/journal_details' : (context){
            final map = ModalRoute.of(context)!.settings.arguments
            as Map<String, Object>;
            return JournalDetailsScreen(
              journal_id: map['journal_id'] as int,
              list: map['list'] as List<Journal>,
            );
          },
          '/main_screen/like_screen/newspaper_details' : (context){
            final map = ModalRoute.of(context)!.settings.arguments
            as Map<String, Object>;
            return NewspaperDetailsScreen(
                newspaper_id: map['newspaper_id'] as int,
                list: map['list'] as List<Newspaper>);
          }
        },
        initialRoute: '/main_screen');
  }
}
