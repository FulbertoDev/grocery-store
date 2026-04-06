import 'local_service.dart';

class LocalClient {
  LocalService? _api;

  LocalService localService() => _api!;

  static final LocalClient _localClient = LocalClient._internal();

  factory LocalClient() => _localClient;

  LocalClient._internal() {
    _api ??= LocalService();
  }
}
