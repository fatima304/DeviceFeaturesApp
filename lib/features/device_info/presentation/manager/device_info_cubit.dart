import 'package:device_features_app/features/device_info/data/data_source/device_info_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  final DeviceInfoDataSource _dataSource;

  DeviceInfoCubit(this._dataSource) : super(const DeviceInfoState());

  Future<void> getDeviceInfo() async {
    emit(const DeviceInfoState(status: DeviceInfoStatus.loading));

    try {
      // Fetch device information from the data source.
      final deviceInfo = await _dataSource.getDeviceInfo();

      emit(
        DeviceInfoState(
          status: DeviceInfoStatus.success,
          deviceInfo: deviceInfo,
        ),
      );
    } catch (e) {
      emit(
        DeviceInfoState(
          status: DeviceInfoStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
