import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_taking/database/notes_model.dart';
import 'package:notes_taking/edit_note.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddNote(),
    );
  }
}

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final newNotes = NotesModel(
                        description: '',
                        date: DateTime.now());
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditNote(existingNotes: newNotes)),
                    );
                  }
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
    );
  }
}
