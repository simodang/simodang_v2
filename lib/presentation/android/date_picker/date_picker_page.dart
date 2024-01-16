import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_v2/presentation/android/date_picker/date_picker_controller.dart';
import 'package:simodang_v2/presentation/android/shared/widgets/row_label_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPage extends GetView<DatePickerController> {
  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());

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
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value.endDate == null) {
                  return;
                }
                controller.changeEndDate(args.value.endDate);
                controller.changeStartDate(args.value.startDate);
              },
            ),
            SizedBox(height: 15),
            Obx(() => RowLabelWidget(
              label: "Tanggal Awal",
              value: controller.getStartDateString(),
            )),
            SizedBox(height: 10),
            Obx(() => RowLabelWidget(
              label: "Tanggal Akhir",
              value: controller.getEndDateString(),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.submit(),
        child: const Icon(Icons.check),
      )
    );
  }
}