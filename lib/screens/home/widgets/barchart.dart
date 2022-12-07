import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16)),
                width: 300,
                padding: const EdgeInsets.all(10),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: DChartBar(
                    data: const [
                      {
                        'id': 'Bar',
                        'data': [
                          {'domain': 'Mon', 'measure': 3},
                          {'domain': 'Tue', 'measure': 4},
                          {'domain': 'Wed', 'measure': 6},
                          {'domain': 'Thur', 'measure': 0.3},
                          {'domain': 'Fri', 'measure': 3},
                          {'domain': 'Sat', 'measure': 4},
                          {'domain': 'Sun', 'measure': 6},
                        ],
                      },
                    ],
                    domainLabelPaddingToAxisLine: 10,
                    axisLineTick: 2,
                    axisLinePointTick: 2,
                    axisLinePointWidth: 10,
                    axisLineColor: Colors.green,
                    measureLabelPaddingToAxisLine: 16,
                    barColor: (barData, index, id) => Colors.green,
                    showBarValue: true,
                    minimumPaddingBetweenLabel: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
