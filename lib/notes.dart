import 'package:flutter/material.dart';
import 'package:notes_taking/database/crud.dart';

import 'database/notes_model.dart';
import 'edit_note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final Notes _notes = Notes();
  late Future<List<NotesModel>> _noteList;

  @override
  void initState() {
    super.initState();
  _noteList = _fetchNotes();
  }

  Future<List<NotesModel>> _fetchNotes() async {
   return await _notes.getAllNotes();
  }

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
