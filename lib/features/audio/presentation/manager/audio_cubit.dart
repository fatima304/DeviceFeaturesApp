import 'package:device_features_app/features/audio/data/data_source/audio_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'audio_state.dart';

// Cubit for managing audio recording and playback state
class AudioCubit extends Cubit<AudioState> {
  final AudioDataSource _dataSource;

  AudioCubit(this._dataSource) : super(const AudioState());

  // Integration with record package to start audio recording
  Future<void> startRecording() async {
    try {
      final hasPermission = await _dataSource.hasPermission();

      if (!hasPermission) {
        emit(
          const AudioState(
            status: AudioStatus.error,
            errorMessage: 'Microphone permission denied.',
          ),
        );
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      final path = '${directory.path}/recording.m4a';

      await _dataSource.startRecording(path);

      emit(const AudioState(status: AudioStatus.recording));
    } catch (e) {
      emit(AudioState(status: AudioStatus.error, errorMessage: e.toString()));
    }
  }

  // Integration with record package to stop recording and save file
  Future<void> stopRecording() async {
    try {
      final path = await _dataSource.stopRecording();

      if (path == null) {
        emit(
          const AudioState(
            status: AudioStatus.error,
            errorMessage: 'Recording file was not created.',
          ),
        );
        return;
      }

      emit(AudioState(status: AudioStatus.recorded, audioPath: path));
    } catch (e) {
      emit(AudioState(status: AudioStatus.error, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _dataSource.dispose();
    return super.close();
  }

  // Integration with audioplayers package to play recorded audio
  Future<void> playAudio() async {
    final path = state.audioPath;

    if (path == null) {
      return;
    }

    try {
      emit(AudioState(status: AudioStatus.playing, audioPath: path));

      // Pass callback to handle playback completion
      await _dataSource.playAudio(path, () {
        // Return to recorded state when playback completes
        emit(AudioState(status: AudioStatus.recorded, audioPath: path));
      });
    } catch (e) {
      emit(
        AudioState(
          status: AudioStatus.error,
          audioPath: path,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // Stop audio playback manually
  Future<void> stopPlayback() async {
    final path = state.audioPath;

    if (path == null) {
      return;
    }

    try {
      await _dataSource.stopPlayback();

      emit(AudioState(status: AudioStatus.recorded, audioPath: path));
    } catch (e) {
      emit(
        AudioState(
          status: AudioStatus.error,
          audioPath: path,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
