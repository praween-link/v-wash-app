import 'package:get/get.dart';

class MainHomeViewmodel extends GetxController {
  var isAppDrawerOpen = false.obs;
  var drawerSelectedTile = 0.obs;
  var currentScreenIndex = 0.obs;
}
