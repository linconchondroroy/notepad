import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../data/models/note_model.dart';

class NoteController extends GetxController {

  RxList<Note> notes = <Note>[].obs;

  late Box<Note> noteBox;

  @override
  void onInit() {
    super.onInit();

    openBox();
  }

  void openBox() async {

    noteBox = await Hive.openBox<Note>('notesBox');

    loadNotes();
  }

  void loadNotes() {

    notes.value = noteBox.values.toList();
  }

  void addNote(String title, String content) {

    final note = Note(
      title: title,
      content: content,
    );

    noteBox.add(note);

    loadNotes();
  }

  void deleteNote(int index) {

    noteBox.deleteAt(index);

    loadNotes();
  }

  void togglePin(int index) {

    final note = notes[index];

    note.isPinned = !note.isPinned;

    note.save();

    loadNotes();
  }

  void updateNote(
      int index,
      String title,
      String content,
      ) {

    final note = notes[index];

    note.title = title;

    note.content = content;

    note.save();

    loadNotes();
  }

  List<Note> searchNotes(String query) {

    return notes.where((note) {

      return note.title
          .toLowerCase()
          .contains(query.toLowerCase());

    }).toList();
  }
}