import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/core/services/services_locator.dart';
import 'package:news_app/core/utils/app_constance/app_constance.dart';
import 'package:news_app/presentation/controller/news_bloc.dart';
import 'package:news_app/presentation/controller/news_event.dart';

import 'articles/apple_articles_screen.dart';
import 'articles/business_articles_screen.dart';
import 'articles/tesla_articles_screen.dart';
import 'articles/wallstreet_articles_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List screens = [
    const AppleArticlesScreen(),
    const BuisnessArticlesScreen(),
    const TeslaArticlesScreen(),
    const WallStreetArticlesScreen(),
  ];

  late String screenTitle;
  @override
  void initState() {
    screenTitle = AppString.titles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<NewsBloc>()
        ..add(GetAppleArticlesEvent())
        ..add(GetBuisnessArticlesEvent())
        ..add(GetTeslaArticlesEvent())
        ..add(GetWallStreetArticlesEvent()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 27, 42, 58),
          elevation: 20,
          title: Text(screenTitle),
        ),
        body: Center(
          child: screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.1),
              )
            ],
          ),
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 27, 42, 58),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
              child: GNav(
                curve: Curves.easeInOutCubic,
                gap: 4,
                iconSize: 28,
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.transparent,
                color: Colors.white,
                activeColor: Colors.white,
                tabBorderRadius: 30,
                tabBackgroundColor: Colors.black.withOpacity(0.1),
                textStyle: Theme.of(context).textTheme.subtitle2,
                tabs: [
                  GButton(
                    icon: Icons.apple,
                    text: AppString.titles[0],
                  ),
                  GButton(
                    icon: Icons.business,
                    text: AppString.titles[1],
                  ),
                  GButton(
                    icon: Icons.text_fields_sharp,
                    text: AppString.titles[2],
                  ),
                  GButton(
                    icon: Icons.work_outline_sharp,
                    text: AppString.titles[3],
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    screenTitle = AppString.titles[index];
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
