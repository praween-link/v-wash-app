import 'package:appwash/utils/local_db/local_db.dart';

import 'local_db_keys.dart';

/// Local Strage Info ///
class LocalInfoSave {
  static void saveData(String key, Object value) {
    LocalDB.saveData(key, value);
  }
}

class LocalInfo {
  static get primaryColor => LocalDB.getData(LocalKeys.primary_color);

  ///
  static get email => LocalDB.getData(LocalKeys.email);
}
