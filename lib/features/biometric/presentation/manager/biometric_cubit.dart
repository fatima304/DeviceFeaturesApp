import 'package:device_features_app/features/biometric/data/data_source/biometric_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  final BiometricDataSource _dataSource;

  BiometricCubit(this._dataSource) : super(const BiometricState());

  Future<void> authenticate() async {
    emit(const BiometricState(status: BiometricStatus.loading));

    try {
      final isAuthenticated = await _dataSource.authenticate();

      if (isAuthenticated) {
        emit(const BiometricState(status: BiometricStatus.success));
      } else {
        emit(
          const BiometricState(
            status: BiometricStatus.failure,
            errorMessage: 'Authentication failed.',
          ),
        );
      }
    } catch (e) {
      emit(
        BiometricState(
          status: BiometricStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
