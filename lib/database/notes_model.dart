import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  final String description;
  @HiveField(1)
  final DateTime date;

  NotesModel({
    required this.description,
    required this.date
  });
}
