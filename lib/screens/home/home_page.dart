import 'package:digi_farmers/models/weights.dart';
import 'package:digi_farmers/screens/home/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:isoweek/isoweek.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../services/db_service.dart';
import 'widgets/balance.dart';
import 'widgets/barchart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ValueNotifier<List<WeightData>> weightData;
  late Week currentWeek;
  late Week previousWeek;

  @override
  void initState() {
    weightData = ValueNotifier([]);
    currentWeek = Week.current();
    previousWeek = currentWeek.previous;
    super.initState();
  }

  @override
  void dispose() {
    //weightData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              },
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.green,
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.green,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('images/down.jpeg'),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: FutureBuilder(
            future: DatabaseService.fetchUserId(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ValueListenableBuilder(
                  valueListenable: DatabaseService.fetchUpdatesRealtime(
                      weightData, snapshot.data!, currentWeek),
                  builder: (context, weights, child) {
                    return SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BarChart(
                              weightData: weights,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Balance(
                              userId: snapshot.data!,
                              currentWeights: weights,
                              comparisonWeek: previousWeek,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Produce Submitted',
                              style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 20, top: 5),
                              child: SfDataGrid(
                                source: EmployeeDataSource(employees: weights),
                                gridLinesVisibility: GridLinesVisibility.both,
                                headerGridLinesVisibility:
                                    GridLinesVisibility.both,
                                columnWidthMode: ColumnWidthMode.fill,
                                columns: <GridColumn>[
                                  GridColumn(
                                    autoFitPadding: const EdgeInsets.all(35),
                                    columnWidthMode: ColumnWidthMode.auto,
                                    columnName: 'date',
                                    label: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade500,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'DATE',
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'time',
                                    label: Container(
                                      color: Colors.grey.shade500,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'TIME',
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridColumn(
                                    columnName: 'amount',
                                    label: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade500,
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'AMOUNT',
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<WeightData> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date',
                  value: DateFormat('dd-MM-yy').format(dataGridRow.dateTime)),
              DataGridCell<String>(
                  columnName: 'time',
                  value: DateFormat('HH:mm').format(dataGridRow.dateTime)),
              DataGridCell<double>(
                  columnName: 'amount', value: dataGridRow.weight),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.grey.shade300,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              height: 2,
              alignment: (dataGridCell.columnName == 'date' ||
                      dataGridCell.columnName == 'amount')
                  ? Alignment.center
                  : Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                dataGridCell.value.toString(),
                // overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(fontSize: 16),
              ));
        }).toList());
  }
}
