//import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pages_familiar/pages/account_page.dart';
import 'package:pages_familiar/pages/categories.dart';
import 'package:pages_familiar/pages/Home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [BlogPage(), CategoriesPage(), AccountPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Home',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.reorder,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Categories',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              // ignore: deprecated_member_use
              title: Text(
                'Account',
                style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                ),
              )),
        ],
      ),
    );
  }
}
