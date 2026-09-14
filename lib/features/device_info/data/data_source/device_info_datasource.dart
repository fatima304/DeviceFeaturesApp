import 'dart:io';

import 'package:device_features_app/features/device_info/data/models/device_info_model.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoDataSource {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<DeviceInfoModel> getDeviceInfo() async {
    // Get device information based on the current platform.
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return DeviceInfoModel.fromAndroidDeviceInfo(androidInfo);
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return DeviceInfoModel.fromIosDeviceInfo(iosInfo);
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }
}
