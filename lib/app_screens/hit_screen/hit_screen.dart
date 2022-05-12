import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/book_screen.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/journal_screen.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_tabs_screen/newspapers_screen.dart';

class HitScreen extends StatefulWidget {
  const HitScreen({Key? key}) : super(key: key);

  @override
  _HitScreenState createState() => _HitScreenState();
}

class _HitScreenState extends State<HitScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(68, 167, 184, 1),
          title: Text("Библиотека"),
          bottom: TabBar(
            tabs: [
              Tab(icon: SvgPicture.asset('assets/book.svg' , color: Colors.white,)),
              Tab(icon: SvgPicture.asset('assets/journal.svg', color: Colors.white,)),
              Tab(icon: SvgPicture.asset('assets/newspaper.svg', color: Colors.white,)),
            ],
          ),
        ),
        body: TabBarView(
          children: [BooksScreen(), JournalScreen(), NewsPapers_Screen()],
        ),
      ),
    );
  }
}
