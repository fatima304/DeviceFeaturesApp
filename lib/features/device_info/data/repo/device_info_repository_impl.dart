import 'package:device_features_app/features/device_info/data/data_source/device_info_datasource.dart';

import '../models/device_info_model.dart';
import 'device_info_repository.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoDataSource _dataSource;

  DeviceInfoRepositoryImpl(this._dataSource);

  @override
  Future<DeviceInfoModel> getDeviceInfo() {
    return _dataSource.getDeviceInfo();
  }
}
