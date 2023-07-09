import 'package:appwash/model/common/theme_model.dart';
import 'package:get/get.dart';

class ThemeViewmodel extends GetxController {
  final _themeMode = Rx<ThemeModel>(
      ThemeModel(darkMode: false, lightMode: false, defaultMode: true));

  get themeMode => _themeMode.value;

  void changeThemeMode({bool? dark, bool? light, bool? system}) {
    if (dark != null && dark) {
      _themeMode.value =
          ThemeModel(darkMode: true, lightMode: false, defaultMode: false);
    } else if (light != null && light) {
      _themeMode.value =
          ThemeModel(darkMode: false, lightMode: true, defaultMode: false);
    } else {
      _themeMode.value =
          ThemeModel(darkMode: false, lightMode: false, defaultMode: true);
    }
  }
}
