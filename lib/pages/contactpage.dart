import 'package:d_chart/d_chart.dart';
import 'package:digi_farmers/util/barchart.dart';
import 'package:flutter/material.dart';


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
            children:  const [
              //  SizedBox(
              //   height: 200,
              //   child: BarChart(),
              // ),
              //  SizedBox(
              //   height: 30,
              // ),
              // Container(color:Colors.blue,child: AspectRatio(aspectRatio: 16/9,child:DChartBarCustom(listData: ,),),)
            ],
          ),
        ),
      ),
    );
  }
}
