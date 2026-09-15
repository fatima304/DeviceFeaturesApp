import 'package:local_auth/local_auth.dart';

// Data source for biometric authentication integration using local_auth package
class BiometricDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

  // Integration with local_auth package to perform biometric authentication
  Future<bool> authenticate() async {
    final isAvailable = await _auth.canCheckBiometrics;

    if (!isAvailable) {
      return false;
    }

    return _auth.authenticate(
      localizedReason: 'Please authenticate to access your profile.',
      biometricOnly: true,
      persistAcrossBackgrounding: true,
    );
  }
}
