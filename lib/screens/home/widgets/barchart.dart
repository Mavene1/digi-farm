import 'package:d_chart/d_chart.dart';
import 'package:digi_farmers/models/weights.dart';
import 'package:flutter/material.dart';
import 'package:isoweek/isoweek.dart';

class BarChart extends StatefulWidget {
  final List<WeightData> weightData;
  const BarChart({super.key, required this.weightData});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16)),
            width: 330,
            height: 150,
            padding: const EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: DChartBar(
                data: [
                  {
                    'id': 'Bar',
                    'data': [
                      {
                        'domain': 'Mon',
                        'measure': sumWeights(widget.weightData, 0)
                      },
                      {
                        'domain': 'Tue',
                        'measure': sumWeights(widget.weightData, 1)
                      },
                      {
                        'domain': 'Wed',
                        'measure': sumWeights(widget.weightData, 2)
                      },
                      {
                        'domain': 'Thur',
                        'measure': sumWeights(widget.weightData, 3)
                      },
                      {
                        'domain': 'Fri',
                        'measure': sumWeights(widget.weightData, 4)
                      },
                      {
                        'domain': 'Sat',
                        'measure': sumWeights(widget.weightData, 5)
                      },
                      {
                        'domain': 'Sun',
                        'measure': sumWeights(widget.weightData, 6)
                      },
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
        ],
      ),
    );
  }
}

double sumWeights(List<WeightData> weightData, int day) {
  double sum = 0;
  for (var data in weightData) {
    final filterDate = Week.fromDate(data.dateTime).day(day);
    if (filterDate.year == data.dateTime.year &&
        filterDate.month == data.dateTime.month &&
        filterDate.day == data.dateTime.day) {
      sum += data.weight;
    }
  }
  return sum;
}
