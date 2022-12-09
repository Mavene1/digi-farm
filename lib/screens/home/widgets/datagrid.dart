// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class DataGrid extends StatefulWidget {
//   const DataGrid({super.key});

//   @override
//   State<DataGrid> createState() => _DataGridState();
// }

// class _DataGridState extends State<DataGrid> {
//   late List<Employee> _employees;
//   late EmployeeDataSource _employeeDataSource;

//   @override
//   void initState() {
//     _employees = getEmployeeData();
//     _employeeDataSource = EmployeeDataSource(employees: _employees);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade50,
//         body: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SfDataGrid(
//                   source: _employeeDataSource,
//                   gridLinesVisibility: GridLinesVisibility.both,
//                   headerGridLinesVisibility: GridLinesVisibility.both,
//                   columnWidthMode: ColumnWidthMode.fill,
//                   columns: <GridColumn>[
//                     GridColumn(
//                       columnName: 'id',
//                       label: Container(
//                         color: Colors.grey.shade500,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'DATE',
//                           style: GoogleFonts.lato(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GridColumn(
//                       columnName: 'name',
//                       label: Container(
//                         color: Colors.grey.shade500,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'TIME',
//                           style: GoogleFonts.lato(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     GridColumn(
//                       columnName: 'salary',
//                       label: Container(
//                         color: Colors.grey.shade500,
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'AMOUNT',
//                           style: GoogleFonts.lato(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<Employee> getEmployeeData() {
//     return [
//       Employee(10001, 'James', 20000),
//       Employee(10002, 'Kathryn', 30000),
//       Employee(10003, 'Lara', 15000),
//       Employee(10004, 'Michael', 15000),
//       Employee(10005, 'Martin', 15000),
//     ];
//   }
// }

// class EmployeeDataSource extends DataGridSource {
//   EmployeeDataSource({required List<Employee> employees}) {
//     dataGridRows = employees
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
//               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
//               DataGridCell<int>(
//                   columnName: 'salary', value: dataGridRow.salary),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> dataGridRows = [];

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         color: Colors.grey.shade300,
//         cells: row.getCells().map<Widget>((dataGridCell) {
//           return Container(
//               alignment: (dataGridCell.columnName == 'id' ||
//                       dataGridCell.columnName == 'salary')
//                   ? Alignment.centerRight
//                   : Alignment.centerLeft,
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Text(
//                 dataGridCell.value.toString(),
//                 overflow: TextOverflow.ellipsis,
//                 style: GoogleFonts.lato(fontSize: 20),
//               ));
//         }).toList());
//   }
// }

// class Employee {
//   Employee(this.id, this.name, this.salary);
//   final int id;
//   final String name;
//   final int salary;
// }
