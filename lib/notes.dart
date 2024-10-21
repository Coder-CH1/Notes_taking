import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          ListView.builder(
            itemCount: 0,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text(''),
              );
            },
          )
        ],
      ),
    );
  }
}
