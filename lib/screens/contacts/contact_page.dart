import 'package:d_chart/d_chart.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: DChartBarCustom(
                        showMeasureLine: true,
                        showDomainLine: true,
                        showDomainLabel: true,
                        showMeasureLabel: true,
                        spaceBetweenItem: 10,
                        spaceDomainLinetoChart: 5,
                        spaceMeasureLinetoChart: 5,
                        radiusBar: BorderRadius.circular(8),
                        max: 6,
                        listData: [
                          DChartBarDataCustom(
                            value: 5,
                            label: 'Jan',
                            color: Colors.green,
                            showValue: true,
                            valueStyle: GoogleFonts.lato(color: Colors.white),
                            onTap: () {},
                          ),
                          DChartBarDataCustom(
                              value: 2, label: 'Feb', color: Colors.green),
                          DChartBarDataCustom(
                              value: 3, label: 'Mar', color: Colors.green),
                          DChartBarDataCustom(
                              value: 3, label: 'April', color: Colors.green),
                          DChartBarDataCustom(
                              value: 4, label: 'May', color: Colors.green),
                          DChartBarDataCustom(
                              value: 1, label: 'June', color: Colors.green),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Text(
                      'GITHUNGURI DAIRIES',
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      highlightColor: Colors.black,
                      onTap: () async {
                        //print('tapped');
                        final call = Uri.parse('tel:+254712162894');
                        if (await canLaunchUrl(call)) {
                          launchUrl(call);
                        } else {
                          throw 'Could not launch $call';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.green),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '+254712162894',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      highlightColor: Colors.green,
                      onTap: () async {
                        final email = Uri(
                          scheme: 'mailto',
                          path: 'support.githu@gmail.com',
                          query: 'subject=Hello&body=Test',
                        );
                        if (await canLaunchUrl(email)) {
                          launchUrl(email);
                        } else {
                          throw 'Could not launch $email';
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'support.githu@gmail.com',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
