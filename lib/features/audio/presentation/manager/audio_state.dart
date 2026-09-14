// State management for audio recording and playback
enum AudioStatus { initial, recording, recorded, playing, error }

class AudioState {
  final AudioStatus status;
  final String? audioPath;
  final String? errorMessage;

  const AudioState({
    this.status = AudioStatus.initial,
    this.audioPath,
    this.errorMessage,
  });
}
