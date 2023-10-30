import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = FlutterSecureStorage();

  static Future writeData(String value, String key) async {
    final writeData = await storage.write(key: key, value: value);
    return writeData;
  }

  static Future readData(String key) async {
    final readData = await storage.read(key: key);
    return readData;
  }

  static Future deleteData(String key) async {
    final deleteData = await storage.delete(key: key);
    return deleteData;
  }

  static Future deleteAll() async {
    final deleteAll = await storage.deleteAll();
    return deleteAll;
  }
}