import 'package:flutter/material.dart';

class ProjectManagerScreen extends StatefulWidget {
  @override
  _ProjectManagerScreenState createState() => _ProjectManagerScreenState();
}

class _ProjectManagerScreenState extends State<ProjectManagerScreen> {
  List<String> projects = [];
  final TextEditingController _controller = TextEditingController();

  void _createProject() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        projects.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _openProject(String project) {
    // Open the project logic can be implemented here.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opening project: $project')));
  }

  void _manageProject(int index) {
    // Manage the project logic can be implemented here. For now, just showing a snackbar.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Managing project: ${projects[index]}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Project Manager')), 
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter project name'),
            ),
          ),
          ElevatedButton(
            onPressed: _createProject,
            child: Text('Create Project'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(projects[index]),
                  onTap: () => _openProject(projects[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _manageProject(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
