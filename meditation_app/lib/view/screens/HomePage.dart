import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meditation_app/View/screens/HabitTracker.dart';
import 'package:meditation_app/View/screens/ProfileScreen.dart';
import 'package:meditation_app/View/screens/HomeTab.dart';

import '../widgets/BottomNavigationBar.dart';
import 'StatusDiary.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBarScreen(
      screens: const [
        Hometab(),
        StatusDiary(),
        HabitTracker(),
        ProfileScreen(),
      ],
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
