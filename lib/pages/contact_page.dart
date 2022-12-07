import 'package:d_chart/d_chart.dart';
import 'package:digi_farmers/util/barchart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    const Icon(
                      Icons.menu,
                      color: Colors.green,
                    ),
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
                padding: const EdgeInsets.all(20),
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
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.green),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '+254723426492',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
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
