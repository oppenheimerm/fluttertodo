import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todoapp/core/enums/apptypes.dart';

class SecureStore {
  /// The storage object
  FlutterSecureStorage? _storage;

  SecureStore() {
    _storage = new FlutterSecureStorage();
  }

  /// Get value from secure storage
  Future<String?> getValue(String val) async => await _storage?.read(key: val);

  /// Write value to secure storage
  //Future setValue(String key, String val) async => await _storage.write(key: key, value: val);

  Future setAccessToken(String accessToken) async {
    // key exist
    var valueExist = await _storage?.read(key: StorageType.storageAccessToken.toString());
    if (valueExist == null) {
      //  just set it
      await _storage?.write(
          key: StorageType.storageAccessToken.toString(), value: accessToken);
    } else {
      //  remove old key
      await _storage?.delete(key: StorageType.storageAccessToken.toString());
      //  add new value
      await _storage?.write(
          key: StorageType.storageAccessToken.toString(), value: accessToken);
    }
  }


  Future setRefreshToken(String refreshToken) async {
    // key exist
    var valueExist = await _storage?.read(
        key: StorageType.storageRefreshToken.toString());
    if (valueExist == null) {
      //  just set it
      await _storage?.write(
          key: StorageType.storageRefreshToken.toString(), value: refreshToken);
    } else {
      //  remove old key
      await _storage?.delete(key: StorageType.storageRefreshToken.toString());
      //  add new value
      await _storage?.write(
          key: StorageType.storageRefreshToken.toString(), value: refreshToken);
    }
  }

  Future setEmail(String email) async {
    // key exist
    var valueExist = await _storage?.read(
        key: StorageType.storageEmail.toString());
    if (valueExist == null) {
      //  just set it
      await _storage?.write(
          key: StorageType.storageEmail.toString(), value: email);
    } else {
      //  remove old key
      await _storage?.delete(key: StorageType.storageEmail.toString());
      //  add new value
      await _storage?.write(
          key: StorageType.storageEmail.toString(), value: email);
    }
  }

  Future setUserId(String userId) async {
    // key exist
    var valueExist = await _storage?.read(
        key: StorageType.storageUserId.toString());
    if (valueExist == null) {
      //  just set it
      await _storage?.write(
          key: StorageType.storageUserId.toString(), value: userId);
    } else {
      //  remove old key
      await _storage?.delete(key: StorageType.storageUserId.toString());
      //  add new value
      await _storage?.write(
          key: StorageType.storageUserId.toString(), value: userId);
    }
  }

  Future setFirstName(String firstName) async {
    // key exist
    var valueExist = await _storage?.read(
        key: StorageType.storageFirstname.toString());
    if (valueExist == null) {
      //  just set it
      await _storage?.write(
          key: StorageType.storageFirstname.toString(), value: firstName);
    } else {
      //  remove old key
      await _storage?.delete(key: StorageType.storageFirstname.toString());
      //  add new value
      await _storage?.write(
          key: StorageType.storageFirstname.toString(), value: firstName);
    }
  }

  Future setLoginStorageValues(
      String accessToken,
      String refreshToken,
      String email,
      String userId,
      String firstName,
      ) async {
    await setAccessToken(accessToken);
    await setRefreshToken(refreshToken);
    await setEmail(email);
    await setUserId(userId);
    await setFirstName(firstName);
  }

  Future updateTokens(
      String accessToken,
      String refreshToken,
      ) async
  {
    await setAccessToken(accessToken);
    await setRefreshToken(refreshToken);
  }

}