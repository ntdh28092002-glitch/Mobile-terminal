import 'package:flutter/material.dart';

class CommandHistoryScreen extends StatefulWidget {
  @override
  _CommandHistoryScreenState createState() => _CommandHistoryScreenState();
}

class _CommandHistoryScreenState extends State<CommandHistoryScreen> {
  final List<String> _commandHistory = [];
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  void _saveCommand(String command) {
    if (command.isNotEmpty) {
      setState(() {
        _commandHistory.add(command);
        _controller.clear();
      });
    }
  }

  List<String> _getFilteredCommands() {
    return _commandHistory.where((command) => command.contains(_searchQuery)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Command History')), 
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter Command',
              suffixIcon: IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _saveCommand(_controller.text),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getFilteredCommands().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_getFilteredCommands()[index]),
                  onTap: () {
                    _controller.text = _getFilteredCommands()[index];
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}