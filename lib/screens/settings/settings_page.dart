import 'package:digi_farmers/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  DatabaseService databaseService = DatabaseService();
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
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Colors.green,
                  onTap: () {
                    //print('tap detected');
                  },
                  child: Row(
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
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Colors.green,
                  onTap: () {
                    //print('tappings');
                  },
                  child: Row(
                    children: [
                      Text('Privacy and Policy',
                          style: GoogleFonts.lato(
                              fontSize: 20, color: Colors.grey[800])),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Colors.green,
                  onTap: () {
                    //print('detected');
                  },
                  child: Row(
                    children: [
                      Text('Terms of Use',
                          style: GoogleFonts.lato(
                              fontSize: 20, color: Colors.grey[800])),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: Colors.green,
                  onTap: () {
                    //print('tap');
                  },
                  child: Row(
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
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      await Supabase.instance.client.auth.signOut();
                      Supabase.instance.client.auth.currentUser == null;
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
                // FutureBuilder(
                //     future: databaseService.fetchData(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return ListView();
                //       }
                //       return Container();
                //     }),
                MaterialButton(
                  onPressed: () {
                    databaseService.fetchData();
                  },
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
