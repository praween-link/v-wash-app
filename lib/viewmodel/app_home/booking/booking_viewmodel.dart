import 'package:get/get.dart';

class BookingViewmodel extends GetxController {
  var selectedVehicleIndex = (-1).obs;
  var selectedTimeSlotIndex = (-1).obs;
  //
  var processTypes = ["OneTime", "TimeTap", "ScheduleOnce"].obs;
  var selectedProcessTypeIndex = (2).obs;
}
