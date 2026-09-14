import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoModel {
  final String modelName;
  final String osVersion;

  const DeviceInfoModel({required this.modelName, required this.osVersion});

  factory DeviceInfoModel.fromAndroidDeviceInfo(AndroidDeviceInfo info) {
    return DeviceInfoModel(
      modelName: info.model,
      osVersion: info.version.release,
    );
  }
}
