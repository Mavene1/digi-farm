import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.green,
          ),
        ),
        title: Text('Notifications',
            style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(
            Icons.circle_notifications_rounded,
            color: Colors.green,
            size: 90,
          ),
          Text(
            'No Notifications',
            style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700),
          )
        ]),
      ),
    );
  }
}
