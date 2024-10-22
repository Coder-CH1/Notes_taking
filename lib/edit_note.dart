import 'package:flutter/material.dart';
import 'package:notes_taking/database/crud.dart';
import 'package:notes_taking/database/notes_model.dart';
import 'main.dart';

class EditNote extends StatefulWidget {
  final NotesModel? existingNotes;
  const EditNote({super.key, required this.existingNotes});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final TextEditingController _controller = TextEditingController();
  final Notes _notes = Notes();
  @override
  void initState() {
    super.initState();
  }

  void _saveNotes() async {
  final description = _controller.text;
  if(description.isNotEmpty) {
    final newNotes = NotesModel(
        description: description,
        date: DateTime.now());
    await _notes.addNotes(newNotes);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => NotesPage(existingNotes: newNotes)),
        (routes) => false,
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child: TextField(
                controller: _controller,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                ),
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Type notes',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                    ),
                  ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10,
                ),
                child: const Text('Add',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                onPressed: () {
                  _saveNotes();
                }
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
