import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sql_project_part3/app_screens/category_screen.dart';
import 'package:sql_project_part3/app_screens/hit_screen/hit_screen.dart';
import 'package:sql_project_part3/app_screens/like_screen.dart';
import 'package:sql_project_part3/app_screens/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _selectedPage,
          children: [
            HitScreen(),
            CategoryScreen(),
            LikeScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset(
                  'assets/library.svg',
                  color: _selectedPage == 0
                      ? Color.fromRGBO(68, 167, 184, 1)
                      : Color.fromRGBO(144, 153, 170, 1),
                )),
            label: 'Библиотека',
          ),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    'assets/catalog.svg',
                    color: _selectedPage == 1
                        ? Color.fromRGBO(68, 167, 184, 1)
                        : Color.fromRGBO(144, 153, 170, 1),
                  )),
              label: 'Каталог'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.all(5),
                  child: SvgPicture.asset('assets/like.svg',
                      color: _selectedPage == 2
                          ? Color.fromRGBO(68, 167, 184, 1)
                          : Color.fromRGBO(144, 153, 170, 1))),
              label: 'Сохраненные'),
          BottomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.all(5),
                child: SvgPicture.asset('assets/profile.svg',
                    color: _selectedPage == 3
                        ? Color.fromRGBO(68, 167, 184, 1)
                        : Color.fromRGBO(144, 153, 170, 1))),
            label: 'Профиль',
          ),
        ],
        onTap: onSelectPage,
      ),
    );
  }
}
