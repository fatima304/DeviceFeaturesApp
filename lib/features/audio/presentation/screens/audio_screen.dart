import 'package:device_features_app/features/audio/data/data_source/audio_datasource.dart';
import 'package:device_features_app/features/audio/presentation/manager/audio_cubit.dart';
import 'package:device_features_app/features/audio/presentation/manager/audio_state.dart';
import 'package:device_features_app/features/audio/presentation/screens/widgets/play_audio_button.dart';
import 'package:device_features_app/features/audio/presentation/screens/widgets/record_audio_button.dart';
import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Main screen for audio recording and playback
class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AudioCubit(AudioDataSource()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('Audio'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        body: BlocConsumer<AudioCubit, AudioState>(
          listener: (context, state) {
            if (state.status == AudioStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Something went wrong.'),
                ),
              );
            }
          },
          builder: (context, state) {
            final isRecording = state.status == AudioStatus.recording;

            final isPlaying = state.status == AudioStatus.playing;

            final hasRecording = state.audioPath != null;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.mic_none,
                    size: 80,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    isRecording
                        ? 'Recording...'
                        : isPlaying
                        ? 'Playing...'
                        : hasRecording
                        ? 'Audio recorded successfully'
                        : 'Record your audio',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading,
                  ),
                  const SizedBox(height: 32),
                  RecordAudioButton(
                    isRecording: isRecording,
                    onPressed: () {
                      final cubit = context.read<AudioCubit>();

                      if (isRecording) {
                        cubit.stopRecording();
                      } else {
                        cubit.startRecording();
                      }
                    },
                  ),
                  if (hasRecording && !isRecording) ...[
                    const SizedBox(height: 16),
                    PlayAudioButton(
                      isPlaying: isPlaying,
                      onPressed: () {
                        final cubit = context.read<AudioCubit>();

                        if (isPlaying) {
                          cubit.stopPlayback();
                        } else {
                          cubit.playAudio();
                        }
                      },
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
