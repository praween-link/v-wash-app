import 'package:appwash/utils/enums.dart';
import 'package:get/get.dart';

class WashPlanViewmodel extends GetxController {
  var washPlanType = Rx<WashPlan>(WashPlan.BASIC);
}
