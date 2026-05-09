import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/note_controller.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

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

  @override
  Widget build(BuildContext context) {

    if (note != null) {

      titleController.text = note!.title;

      contentController.text = note!.content;
    }

    return Scaffold(

      appBar: AppBar(

        title: Text(
          note == null
              ? "Add Note"
              : "Edit Note",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            CustomTextField(

              controller: titleController,

              hintText: "Title",
            ),

            const SizedBox(height: 16),

            CustomTextField(

              controller: contentController,

              hintText: "Content",
            ),

            const SizedBox(height: 20),

            CustomButton(

              text: "Save",

              onPressed: () {

                if (note == null) {

                  controller.addNote(
                    titleController.text,
                    contentController.text,
                  );

                } else {

                  controller.updateNote(
                    index!,
                    titleController.text,
                    contentController.text,
                  );
                }

                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}