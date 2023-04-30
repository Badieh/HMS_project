import 'package:flutter/material.dart';
import 'package:hospital/presentation/resources/color_manager.dart';
import 'package:hospital/presentation/resources/values_manager.dart';

class MyTable extends StatelessWidget {
  final List<List<String>> data;

  MyTable({required this.data});

  @override
  Widget build(BuildContext context) {
    double cellHeight = MediaQuery.of(context).size.height * 0.05;

    return Table(
      border: TableBorder.all(
          color: ColorManager.primary,
          borderRadius:
              BorderRadius.circular(AppSizeHeight.s10)),      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: data.map((rowData) {
        return TableRow(
          children: rowData.map((cellData) {
            return TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: cellHeight,
                child: Center(
                  child: Text(cellData),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
