import 'package:appwash/utils/enums.dart';
import 'package:get/get.dart';

class WashPlanViewmodel extends GetxController {
  var washPlanType = Rx<WashPlan>(WashPlan.BASIC);
  var selected = 0.obs;
}
