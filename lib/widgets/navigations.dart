import 'package:flutter/material.dart';
import 'package:food_deliver/pages/historypage.dart';
import 'package:food_deliver/pages/homepage.dart';
import 'package:food_deliver/pages/likespage.dart';
import 'package:food_deliver/pages/profilepage.dart';
import 'package:heroicons/heroicons.dart';

class BottomNavigations extends StatefulWidget {
  const BottomNavigations({super.key});

  @override
  State<BottomNavigations> createState() => BottomnNavigationState();
}

class BottomnNavigationState extends State<BottomNavigations> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [HomePage(), FoodLikes(), ProfilePage(), HistoryPage()];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.outline),
            activeIcon: HeroIcon(HeroIcons.home, style: HeroIconStyle.solid),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.user, style: HeroIconStyle.outline),
            activeIcon: HeroIcon(HeroIcons.user, style: HeroIconStyle.solid),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            activeIcon: Icon(Icons.history_outlined),
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 250, 74, 12),
      ),
    );
  }
}
