import 'package:flutter/material.dart';

import 'features/device_info/presentation/screens/device_info_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DeviceFeaturesApp());
}

class DeviceFeaturesApp extends StatelessWidget {
  const DeviceFeaturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Features App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        useMaterial3: true,
      ),
      home: const DeviceInfoScreen(),
    );
  }
}
