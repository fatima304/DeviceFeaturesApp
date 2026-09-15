import 'package:local_auth/local_auth.dart';

class BiometricDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

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
