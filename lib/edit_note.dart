import 'package:flutter/material.dart';
import 'package:notes_taking/database/crud.dart';
import 'package:notes_taking/database/notes_model.dart';
import 'package:notes_taking/notes.dart';

class EditNote extends StatefulWidget {

  const EditNote({super.key});

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
                  final newNotes = NotesModel(
                      description: '',
                      date: DateTime.now());
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NotesPage(existingNotes: newNotes)),
                  );
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
