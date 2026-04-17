import 'package:dio/dio.dart';
import 'package:ssh2/ssh2.dart';

class SSHService {
  final String host;
  final String username;
  final String password;
  SSHClient? _client;

  SSHService({required this.host, required this.username, required this.password});

  Future<bool> connect() async {
    try {
      _client = SSHClient(
        host: host,
        port: 22,
        username: username,
        password: password,
      );
      await _client!.connect();
      return true;
    } catch (e) {
      print('Failed to connect: $e');
      return false;
    }
  }

  Future<String?> executeCommand(String command) async {
    if (_client == null) {
      print('Client not connected.');
      return null;
    }
    try {
      final result = await _client!.execute(command);
      return result;
    } catch (e) {
      print('Command execution failed: $e');
      return null;
    }
  }

  Future<void> disconnect() async {
    if (_client != null) {
      _client!.disconnect();
    }
  }
}