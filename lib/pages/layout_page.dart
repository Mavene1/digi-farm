import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digi_farmers/pages/contact_page.dart';
import 'package:digi_farmers/pages/home_page.dart';
import 'package:digi_farmers/pages/settings_page.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ContactPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade50,
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
          setState(() {
            currentPage = index;
          });
        },
        index: currentPage,
      ),
    );
  }
}