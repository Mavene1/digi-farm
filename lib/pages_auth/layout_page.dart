import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import '../screens/contacts/contact_page.dart';
import '../screens/home/home_page.dart';
import '../screens/settings/settings_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<Widget> pages = const [HomePage(), ContactPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
        children: const [
          HomePage(),
          ContactPage(),
          SettingsPage(),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade200,
        color: Colors.grey.shade400,
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(
            Icons.home,
            color: Colors.green,
          ),
          Icon(
            Icons.phone,
            color: Colors.green,
          ),
          Icon(
            Icons.settings,
            color: Colors.green,
          ),
        ],
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        index: currentPage,
      ),
    );
  }
}
