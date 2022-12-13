import 'package:admin_panel/pages/category.dart';
import 'package:admin_panel/pages/oder_page.dart';
import 'package:admin_panel/pages/product_page.dart';
import 'package:admin_panel/pages/user_profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List tabs = [OrderPage(), ProductPage(), Category(), UserProfile()];
  int _selectedIndex = 0;
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            OrderPage(),
            Category(),
            ProductPage(),
            UserProfile()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Order'), icon: Icon(Icons.shopping_cart)),
          BottomNavyBarItem(
              title: Text('Category'), icon: Icon(Icons.category_rounded)),
          BottomNavyBarItem(
              title: Text('Product'), icon: Icon(Icons.gif_box_rounded)),
          BottomNavyBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.person_outline_outlined)),
        ],
      ),
    );
  }
}
