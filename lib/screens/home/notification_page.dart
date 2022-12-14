import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
            style: GoogleFonts.lato(
              fontSize: 16,
            )),
        backgroundColor: Colors.green,
      ),
      body: Container(),
    );
  }
}
