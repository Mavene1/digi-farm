import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wafula',
                  style: GoogleFonts.lato(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey.shade800,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('Change Password',
                        style: GoogleFonts.lato(
                            fontSize: 20, color: Colors.grey[800])),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Privacy and Policy',
                    style: GoogleFonts.lato(
                        fontSize: 20, color: Colors.grey[800])),
                const SizedBox(
                  height: 20,
                ),
                Text('Terms of Use',
                    style: GoogleFonts.lato(
                        fontSize: 20, color: Colors.grey[800])),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.help_outline_rounded, color: Colors.grey[800]),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('Help and Support',
                        style: GoogleFonts.lato(
                            fontSize: 20, color: Colors.grey[800])),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      await Supabase.instance.client.auth.signOut();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style: GoogleFonts.lato(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
