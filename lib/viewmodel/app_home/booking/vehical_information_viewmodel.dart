import 'package:appwash/utils/enums.dart';
import 'package:get/get.dart';

class VehicleInformationViewmodel extends GetxController {
  var selectedBrand = (-1).obs;
  var wheelerType = Rx<WheelerType>(WheelerType.TWO);
  var vehicleColors = [
    "FF0000",
    "121212",
    "FFFFFF",
    "8D8D8D",
    "250F65",
    "445E0C",
    "FFFFFF",
    "8D8D8D",
    "250F65",
    "445E0C",
  ];
}
