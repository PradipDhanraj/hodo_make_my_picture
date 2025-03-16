abstract class BackgroundService {
  Future<bool> downloadGameAssets();
}

class HttpBackgroundService implements BackgroundService {
  @override
  Future<bool> downloadGameAssets() async {
    // Download game assets
    return true;
  }
}
