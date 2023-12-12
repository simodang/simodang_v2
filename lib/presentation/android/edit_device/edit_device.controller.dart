import 'package:get/get.dart';

class EditDeviceController extends GetxController {
  var isMaintenance = false.obs;
  var isFeedAuto = false.obs;
  var isWaterAuto = false.obs;

  setMaintenance(bool value) => isMaintenance.value = value;
  setFeedAuto(bool value) => isFeedAuto.value = value;
  setWaterAuto(bool value) => isWaterAuto.value = value;

  // TEMP AREA //
  // Final
  var tempMin = 0.obs;
  var tempMax = 100.obs;
  // Temp
  var tempMinTemp = 0.obs;
  var tempMaxTemp = 100.obs;

  setTempMin(int value) => tempMinTemp.value = value;
  setTempMax(int value) => tempMaxTemp.value = value;

  setFinalTemp() {
    tempMin.value = tempMinTemp.value;
    tempMax.value = tempMaxTemp.value;
  }

  // PH AREA //
  // Final
  var phMin = 0.obs;
  var phMax = 100.obs;
  // Temp
  var phMinTemp = 0.obs;
  var phMaxTemp = 100.obs;

  setPhMin(int value) => phMinTemp.value = value;
  setPhMax(int value) => phMaxTemp.value = value;

  setFinalPh() {
    phMin.value = phMinTemp.value;
    phMax.value = phMaxTemp.value;
  }

  // TDO AREA //
  // Final
  var tdoMin = 0.obs;
  var tdoMax = 100.obs;
  // Temp
  var tdoMinTemp = 0.obs;
  var tdoMaxTemp = 100.obs;

  setTdoMin(int value) => tdoMinTemp.value = value;
  setTdoMax(int value) => tdoMaxTemp.value = value;

  setFinalTdo() {
    tdoMin.value = tdoMinTemp.value;
    tdoMax.value = tdoMaxTemp.value;
  }

  // TDS AREA //
  // Final
  var tdsMin = 0.obs;
  var tdsMax = 100.obs;
  // Temp
  var tdsMinTemp = 0.obs;
  var tdsMaxTemp = 100.obs;

  setTdsMin(int value) => tdsMinTemp.value = value;
  setTdsMax(int value) => tdsMaxTemp.value = value;

  setFinalTds() {
    tdsMin.value = tdsMinTemp.value;
    tdsMax.value = tdsMaxTemp.value;
  }
  
  // TURBIDITY AREA //
  // Final
  var turbidityMin = 0.obs;
  var turbidityMax = 100.obs;
  // Temp
  var turbidityMinTemp = 0.obs;
  var turbidityMaxTemp = 100.obs;

  setTurbiditasMin(int value) => turbidityMinTemp.value = value;
  setTurbiditasMax(int value) => turbidityMaxTemp.value = value;

  setFinalTurbidity() {
    turbidityMin.value = turbidityMinTemp.value;
    turbidityMax.value = turbidityMaxTemp.value;
  }

  bool isMinLessThanMax(min, max) {
    if (min > max) {
      return false;
    }
    return true;
  }
}