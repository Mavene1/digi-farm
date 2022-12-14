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
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wafula',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.green,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('images/down.jpeg'),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
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
                        size: 18,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('Change Password',
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.grey[800])),
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
                              fontSize: 18, color: Colors.grey[800])),
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
                              fontSize: 18, color: Colors.grey[800])),
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
                      Icon(
                        Icons.help_outline_rounded,
                        color: Colors.grey[800],
                        size: 18,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('Help and Support',
                          style: GoogleFonts.lato(
                              fontSize: 18, color: Colors.grey[800])),
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
                      //Supabase.instance.client.auth.currentUser == null;
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
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
