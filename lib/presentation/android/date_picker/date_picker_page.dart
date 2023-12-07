import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/date_picker/date_picker_controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPage extends GetView<DatePickerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(
          20, // left
          40, // top
          20, // right
          20, // bottom
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Pilih Tanggal",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            SizedBox(height: 15),
            RowLabelWidget(label: "Tanggal Awal", value: "21 Desember 2012"),
            SizedBox(height: 10),
            RowLabelWidget(label: "Tanggal Akhir", value: "25 Desember 2012"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: const Icon(Icons.check),
      )
    );
  }
}