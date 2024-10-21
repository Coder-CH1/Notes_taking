import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_taking/database/notes_model.dart';

class Notes {

  final String  _boxNote = "noteBox";

  Future<Box<NotesModel>> get _box async =>
      await Hive.openBox<NotesModel>(_boxNote);

//create
  Future<void> addNotes(NotesModel noteModel) async {
    var box = await _box;
    await box.add(noteModel);
    print('note added ${noteModel.description}');
  }

//read
  Future<List<NotesModel>> getAllNotes() async {
    var box = await _box;
    List<NotesModel> notes = box.values.toList();
    print('${notes.length}');
    return notes;
  }

//update
  Future<void> updateNotes(int index, NotesModel noteModel) async {
    var box = await _box;
    await box.putAt(index, noteModel);
    print('updated notes at index ${noteModel.description}');
  }

//delete
  Future<void> deleteNotes(int index) async {
    var box = await _box;
    await box.deleteAt(index);
    print('deleted note at index $index');
  }
}