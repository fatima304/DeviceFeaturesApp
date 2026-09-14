import 'package:device_features_app/features/device_info/data/data_source/device_info_datasource.dart';
import 'package:device_features_app/features/device_info/presentation/manager/device_info_cubit.dart';
import 'package:device_features_app/features/device_info/presentation/manager/device_info_state.dart';
import 'package:device_features_app/features/device_info/presentation/screens/widgets/custom_card.dart';
import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Main screen for displaying device information
class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeviceInfoCubit(DeviceInfoDataSource())..getDeviceInfo(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Device Info'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        body: BlocBuilder<DeviceInfoCubit, DeviceInfoState>(
          builder: (context, state) {
            switch (state.status) {
              case DeviceInfoStatus.initial:
              case DeviceInfoStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );

              case DeviceInfoStatus.success:
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        icon: Icons.phone_android,
                        label: 'Device Model',
                        value: state.deviceInfo!.modelName,
                      ),
                      const SizedBox(height: 16),
                      CustomCard(
                        icon: Icons.system_update,
                        label: 'OS Version',
                        value: state.deviceInfo!.osVersion,
                      ),
                    ],
                  ),
                );

              case DeviceInfoStatus.error:
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: AppColors.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.errorMessage ?? 'Something went wrong',
                          style: AppTextStyles.error,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
