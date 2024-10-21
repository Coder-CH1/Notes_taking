import 'package:flutter/material.dart';
import 'package:notes_taking/database/crud.dart';
import 'package:notes_taking/database/notes_model.dart';

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
    if (widget.existingNotes != null) {
      _controller.text = widget.existingNotes!.description;
    }
  }

  void _saveNotes() async {

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
            TextField(
              controller: _controller,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
              ),
                decoration: const InputDecoration(
                  hintText: 'Type notes',
                  hintStyle: TextStyle(
                    color: Colors.white24,
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
