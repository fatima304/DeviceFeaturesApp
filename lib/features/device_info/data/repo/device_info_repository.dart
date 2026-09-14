import '../models/device_info_model.dart';

abstract class DeviceInfoRepository {
  Future<DeviceInfoModel> getDeviceInfo();
}
