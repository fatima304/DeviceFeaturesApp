import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

// Data source for audio recording and playback integration
class AudioDataSource {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  Future<bool> hasPermission() {
    return _recorder.hasPermission();
  }

  // Integration with record package to start audio recording
  Future<void> startRecording(String path) async {
    await _recorder.start(const RecordConfig(), path: path);
  }

  // Integration with record package to stop recording and save file
  Future<String?> stopRecording() {
    return _recorder.stop();
  }

  // Integration with audioplayers package to play audio with completion callback
  Future<void> playAudio(String path, VoidCallback onPlaybackComplete) async {
    await _player.setSource(DeviceFileSource(path));
    await _player.resume();

    // Listen for playback completion to update UI state
    _player.onPlayerComplete.listen((_) {
      onPlaybackComplete();
    });
  }

  // Integration with audioplayers package to stop playback
  Future<void> stopPlayback() async {
    await _player.stop();
  }

  Future<void> dispose() async {
    await _recorder.dispose();
    await _player.dispose();
  }
}
