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
  }

//read
  Future<List<NotesModel>> getAllNotes() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateNotes(int index, NotesModel noteModel) async {
    var box = await _box;
    await box.putAt(index, noteModel);
  }

//delete
  Future<void> deleteNotes(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}