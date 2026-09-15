# Device Features App

A Flutter application that progressively integrates native device capabilities including device information, media access, location and maps, biometric authentication, and audio recording.

## Phase 1 — Device Info

Retrieves and displays basic hardware and software information from the device including the device model name and operating system version.

### Permissions

#### Android
No special permissions are required for the device_info_plus package. Basic device information can be accessed without requesting any permissions.

#### iOS
No special permissions are required for the device_info_plus package. Basic device information can be accessed without requesting any permissions.

## Phase 2 — Media Access: Image Picker Gallery

Create an in-app gallery that lets the user pick multiple images from their device.

### Permissions

#### Android
- `READ_MEDIA_IMAGES` - Required for Android 13+ to access images from the device gallery
- `READ_EXTERNAL_STORAGE` - Required for Android 12 and below to access images from the device gallery

#### iOS
- `NSPhotoLibraryUsageDescription` - Required to access the device photo library for image selection

## Phase 4 — Biometric Authentication: Fingerprint Profile Access

Add a secure profile page to the shopping app that requires fingerprint authentication to access.

### Permissions

#### Android
- `USE_BIOMETRIC` - Required to use fingerprint or face authentication for secure access

#### iOS
- `NSFaceIDUsageDescription` - Required to use Face ID for secure profile authentication

## Phase 5 — Audio: Record and Playback Voice

Build an audio recorder screen that lets the user record their voice and play it back.

### Permissions

#### Android
- `RECORD_AUDIO` - Required to access the microphone for audio recording

#### iOS
- `NSMicrophoneUsageDescription` - Required to access the microphone for audio recording

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
