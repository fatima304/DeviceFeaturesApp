import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Button widget for playing and stopping audio playback
class PlayAudioButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;

  const PlayAudioButton({
    super.key,
    required this.isPlaying,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
        label: Text(isPlaying ? 'Stop' : 'Play Audio'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
