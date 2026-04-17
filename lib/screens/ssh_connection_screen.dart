import 'package:flutter/material.dart';

class SSHConnectionManager {
  String? host;
  String? username;
  String? password;
  int port = 22;
  bool isConnected = false;

  Future<bool> connect() async {
    try {
      isConnected = true;
      return true;
    } catch (e) {
      print('Connection failed: $e');
      return false;
    }
  }

  Future<void> disconnect() async {
    isConnected = false;
  }

  Future<List<String>> getSavedConnections() async {
    return [];
  }

  Future<bool> saveConnection(String name, String host, String username, String password, int port) async {
    return true;
  }
}

class SSHConnectionScreen extends StatefulWidget {
  @override
  _SSHConnectionScreenState createState() => _SSHConnectionScreenState();
}

class _SSHConnectionScreenState extends State<SSHConnectionScreen> {
  final _hostController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _portController = TextEditingController(text: '22');
  final SSHConnectionManager _sshManager = SSHConnectionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SSH Connection')), 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hostController,
              decoration: InputDecoration(labelText: 'Host'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _portController,
              decoration: InputDecoration(labelText: 'Port'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                bool connected = await _sshManager.connect();
                if (connected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Connected successfully!')), 
                  );
                }
              },
              child: Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hostController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _portController.dispose();
    super.dispose();
  }
}