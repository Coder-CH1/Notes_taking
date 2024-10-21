import 'package:flutter/material.dart';
import 'package:notes_taking/database/crud.dart';

import 'database/notes_model.dart';
import 'edit_note.dart';

class NotesPage extends StatefulWidget {
  final NotesModel? existingNotes;
  const NotesPage({super.key, required this.existingNotes});

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
      body: FutureBuilder<List<NotesModel>>(
          future: _noteList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.hasError}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Notes not available'));
            } else {
              final notes = snapshot.data!;
              return ListView.builder(
                itemCount: notes.length,
                  itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note.description),
                    subtitle: Text(note.date.toString()),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditNote(existingNotes: note)),
                      ).then((_) {
                        setState(() {
                          _noteList = _fetchNotes();
                        });
                      });
                    },
                  );
                  }
              );
            }
          }
      )
    );
  }
}
