import 'package:digi_farmers/models/weights.dart';
import 'package:digi_farmers/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isoweek/isoweek.dart';

class Balance extends StatefulWidget {
  final String userId;
  final Week comparisonWeek;
  final List<WeightData> currentWeights;

  const Balance(
      {super.key,
      required this.userId,
      required this.comparisonWeek,
      required this.currentWeights});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  late ValueNotifier<List<WeightData>> previousWeightData;

  @override
  void initState() {
    super.initState();
    previousWeightData = ValueNotifier([]);
  }

  @override
  void dispose() {
    //previousWeightData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currSum = widget.currentWeights
        .map((d) => d.weight)
        .fold(0.0, (sum, w) => sum + w);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                currSum.toStringAsFixed(1),
                style: GoogleFonts.lato(
                  color: Colors.grey.shade800,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Kgs,',
                style: GoogleFonts.lato(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ValueListenableBuilder(
            valueListenable: DatabaseService.fetchUpdatesRealtime(
                previousWeightData, widget.userId, widget.comparisonWeek),
            builder: (context, previousWeights, child) {
              final prevSum = previousWeights
                  .map((d) => d.weight)
                  .fold(0.0, (sum, w) => sum + w);

              final dev = currSum - prevSum;
              final perc = prevSum == 0 ? 100 : dev * 100 / prevSum;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    dev <= 0
                        ? Icons.arrow_drop_down_outlined
                        : Icons.arrow_drop_up_outlined,
                    color: dev <= 0 ? Colors.red : Colors.green,
                  ),
                  Text(
                    '${dev.toStringAsFixed(1)}(${perc.toStringAsFixed(2)}%)',
                    style: GoogleFonts.lato(
                      color: dev <= 0 ? Colors.red : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'from last week.',
                    style: GoogleFonts.lato(
                      color: Colors.grey.shade800,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
