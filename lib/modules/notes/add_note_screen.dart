import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/note_controller.dart';
import '../../data/models/note_model.dart';

class AddNoteScreen extends StatelessWidget {

  final Note? note;

  final int? index;

  AddNoteScreen({
    super.key,
    this.note,
    this.index,
  });

  final NoteController controller =
  Get.find();

  final TextEditingController
  titleController =
  TextEditingController();

  final TextEditingController
  contentController =
  TextEditingController();

  void autoSave() {

    final title = titleController.text.trim();

    final content =
    contentController.text.trim();

    if (title.isEmpty &&
        content.isEmpty) {
      return;
    }

    if (note == null) {

      controller.addNote(
        title,
        content,
      );

    } else {

      controller.updateNote(
        index!,
        title,
        content,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    if (note != null) {

      titleController.text = note!.title;

      contentController.text = note!.content;
    }

    return WillPopScope(

      onWillPop: () async {

        autoSave();

        return true;
      },

      child: Scaffold(

        backgroundColor: Colors.white,

        appBar: AppBar(

          backgroundColor: Colors.white,

          elevation: 0,

          leading: IconButton(

            onPressed: () {

              autoSave();

              Get.back();
            },

            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),

        body: Padding(

          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              TextField(

                controller: titleController,

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),

                decoration:
                const InputDecoration(

                  hintText: "Title",

                  border: InputBorder.none,
                ),
              ),

              Expanded(

                child: TextField(

                  controller:
                  contentController,

                  maxLines: null,

                  expands: true,

                  keyboardType:
                  TextInputType.multiline,

                  textAlignVertical:
                  TextAlignVertical.top,

                  style: const TextStyle(
                    fontSize: 18,
                  ),

                  decoration:
                  const InputDecoration(

                    hintText: "Note",

                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}