import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digi_farmers/pages/contactpage.dart';
import 'package:digi_farmers/pages/homepage.dart';
import 'package:digi_farmers/pages/settingspage.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ContactPage(),SettingsPage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      backgroundColor: Colors.grey.shade400,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade400,
        color: Colors.grey.shade300,
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.phone,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        index: currentPage,
      ),
    );

    
  }
}
