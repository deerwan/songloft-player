import 'dart:js_interop';

import 'package:web/web.dart' as web;

Future<void> clearBrowserCache() async {
  final caches = web.window.caches;
  final keys = (await caches.keys().toDart).toDart;
  for (final key in keys) {
    await caches.delete(key.toDart).toDart;
  }

  try {
    final container = web.window.navigator.serviceWorker;
    final registrations = (await container.getRegistrations().toDart).toDart;
    for (final reg in registrations) {
      await reg.unregister().toDart;
    }
  } catch (_) {
    // Service Worker API 可能不可用（如 HTTP 环境）
  }
}

void reloadPage() {
  web.window.location.reload();
}
