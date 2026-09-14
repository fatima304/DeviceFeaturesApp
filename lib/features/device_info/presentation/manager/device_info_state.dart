import '../../data/models/device_info_model.dart';

enum DeviceInfoStatus { initial, loading, success, error }

class DeviceInfoState {
  final DeviceInfoStatus status;
  final DeviceInfoModel? deviceInfo;
  final String? errorMessage;

  const DeviceInfoState({
    this.status = DeviceInfoStatus.initial,
    this.deviceInfo,
    this.errorMessage,
  });
}
