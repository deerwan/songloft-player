import 'dart:io';

import 'package:flutter/foundation.dart';

class AudioFormatHelper {
  AudioFormatHelper._();

  static const _webFormats = {
    'mp3', 'flac', 'ogg', 'm4a', 'aac', 'wav', 'opus',
  };
  static const _iosFormats = {
    'mp3', 'flac', 'm4a', 'aac', 'wav', 'alac', 'aiff',
  };
  static const _androidFormats = {
    'mp3', 'flac', 'ogg', 'm4a', 'aac', 'wav', 'opus', 'wma',
  };

  static String? getTranscodeFormat(String? songFormat) {
    if (songFormat == null || songFormat.isEmpty) return null;
    final fmt = songFormat.toLowerCase();
    final supported = _getPlatformFormats();
    if (supported.isEmpty) return null;
    if (supported.contains(fmt)) return null;
    return 'mp3';
  }

  static Set<String> _getPlatformFormats() {
    if (kIsWeb) return _webFormats;
    if (Platform.isIOS) return _iosFormats;
    if (Platform.isAndroid) return _androidFormats;
    return {};
  }
}
