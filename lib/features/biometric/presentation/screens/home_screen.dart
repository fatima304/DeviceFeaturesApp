import 'package:device_features_app/features/biometric/data/data_source/biometric_datasource.dart';
import 'package:device_features_app/features/biometric/presentation/manager/biometric_cubit.dart';
import 'package:device_features_app/features/biometric/presentation/manager/biometric_state.dart';
import 'package:device_features_app/features/biometric/presentation/screens/widgets/profile_screen.dart';
import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BiometricCubit(BiometricDataSource()),
      child: BlocListener<BiometricCubit, BiometricState>(
        listener: (context, state) {
          if (state.status == BiometricStatus.success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          } else if (state.status == BiometricStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication failed.'),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Shopping App'),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 2,
            actions: [
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      context.read<BiometricCubit>().authenticate();
                    },
                    icon: const Icon(Icons.person),
                  );
                },
              ),
            ],
          ),
          body: const Center(
            child: Text(
              'Welcome to Shopping App',
              style: AppTextStyles.heading,
            ),
          ),
        ),
      ),
    );
  }
}
