import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Button widget for starting and stopping audio recording
class RecordAudioButton extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onPressed;

  const RecordAudioButton({
    super.key,
    required this.isRecording,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(isRecording ? Icons.stop : Icons.mic),
        label: Text(isRecording ? 'Stop Recording' : 'Record Audio'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
