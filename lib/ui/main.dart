import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes_taking/database/notes_model.dart';
import 'package:notes_taking/ui/edit_note.dart';
import '../database/crud.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  final newNotes = NotesModel(description: '', date: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(existingNotes: newNotes),
    );
  }
}

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
//LIFE CYCLE
  void initState() {
    super.initState();
    _noteList = _fetchNotes();
  }

//FETCHING NOTES METHOD
  Future<List<NotesModel>> _fetchNotes() async {
    return await _notes.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes',
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
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
                final reversedNotes = notes.reversed.toList();
                return ListView.separated(
                    itemCount: reversedNotes.length,
                    separatorBuilder: (context, index) =>
                      const Divider(
                       color: Colors.white24,
                        thickness: 1,
                      ),
                    itemBuilder: (context, index) {
                      final note = reversedNotes[index];
                      final formattedDate = DateFormat('dd MMMM yyyy').format(note.date);
                      return ListTile(
                        title: Text(note.description, style: const TextStyle(color: Colors.white70)),
                        subtitle: Text(formattedDate),
                        onTap: () {
                          final existingNotes = note;
                          final updatedNote = NotesModel(description: existingNotes.description, date: DateTime.now());
                          final actualIndex = reversedNotes.length - 1 - index;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => EditNote(existingNotes: updatedNote, index: actualIndex)),
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
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 150, right: 150),
          child: FloatingActionButton(
            backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const EditNote(existingNotes: null, index: null)),
                      );
          },
            child: const Icon(Icons.add)
              ),
        ),
    );
  }
}
