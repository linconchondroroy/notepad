import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/note_controller.dart';

import '../../core/widgets/note_card.dart';

import '../../modules/notes/add_note_screen.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  final NoteController controller =
  Get.put(NoteController());

  final TextEditingController
  searchController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("My Notes"),

        centerTitle: true,
      ),

      floatingActionButton:
      FloatingActionButton(

        onPressed: () {

          Get.to(() => AddNoteScreen());
        },

        child: const Icon(Icons.add),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(

              controller: searchController,

              decoration: InputDecoration(

                hintText: "Search Notes",

                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(14),
                ),
              ),

              onChanged: (value) {

                controller.loadNotes();
              },
            ),

            const SizedBox(height: 16),

            Expanded(

              child: Obx(() {

                final notes =
                searchController.text.isEmpty

                    ? controller.notes

                    : controller.searchNotes(
                  searchController.text,
                );

                if (notes.isEmpty) {

                  return const Center(
                    child: Text("No Notes Found"),
                  );
                }

                return ListView.builder(

                  itemCount: notes.length,

                  itemBuilder: (context, index) {

                    final note = notes[index];

                    return NoteCard(

                      note: note,

                      onDelete: () {

                        controller.deleteNote(index);
                      },

                      onPin: () {

                        controller.togglePin(index);
                      },

                      onTap: () {

                        Get.to(
                              () => AddNoteScreen(
                            note: note,
                            index: index,
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}