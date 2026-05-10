import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../controllers/note_controller.dart';
import '../../core/widgets/note_card.dart';

import '../notes/add_note_screen.dart';

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

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor: Colors.grey.shade100,

        elevation: 0,

        title: Container(

          padding:
          const EdgeInsets.symmetric(
            horizontal: 12,
          ),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius:
            BorderRadius.circular(18),
          ),

          child: TextField(

            controller: searchController,

            decoration: const InputDecoration(

              hintText: "Search Notes",

              border: InputBorder.none,

              icon: Icon(Icons.search),
            ),

            onChanged: (value) {

              controller.loadNotes();
            },
          ),
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        backgroundColor: Colors.white,

        elevation: 8,

        onPressed: () {

          Get.to(() => AddNoteScreen());
        },

        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(12),

        child: Obx(() {

          final allNotes =
          searchController.text.isEmpty

              ? controller.notes

              : controller.searchNotes(
            searchController.text,
          );

          final pinnedNotes =
          allNotes
              .where(
                (note) => note.isPinned,
          )
              .toList();

          final otherNotes =
          allNotes
              .where(
                (note) => !note.isPinned,
          )
              .toList();

          return SingleChildScrollView(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                if (pinnedNotes.isNotEmpty) ...[

                  const Padding(

                    padding:
                    EdgeInsets.only(
                      left: 6,
                      bottom: 10,
                    ),

                    child: Text(

                      "Pinned",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                  MasonryGridView.count(

                    shrinkWrap: true,

                    physics:
                    const NeverScrollableScrollPhysics(),

                    crossAxisCount: 2,

                    mainAxisSpacing: 12,

                    crossAxisSpacing: 12,

                    itemCount:
                    pinnedNotes.length,

                    itemBuilder:
                        (context, index) {

                      final note =
                      pinnedNotes[index];

                      return NoteCard(

                        note: note,

                        onDelete: () {

                          controller
                              .deleteNote(
                            controller.notes
                                .indexOf(note),
                          );
                        },

                        onPin: () {

                          controller
                              .togglePin(
                            controller.notes
                                .indexOf(note),
                          );
                        },

                        onTap: () {

                          Get.to(
                                () => AddNoteScreen(
                              note: note,
                              index: controller
                                  .notes
                                  .indexOf(note),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                ],

                const Padding(

                  padding: EdgeInsets.only(
                    left: 6,
                    bottom: 10,
                  ),

                  child: Text(

                    "Others",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                MasonryGridView.count(

                  shrinkWrap: true,

                  physics:
                  const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,

                  mainAxisSpacing: 12,

                  crossAxisSpacing: 12,

                  itemCount: otherNotes.length,

                  itemBuilder:
                      (context, index) {

                    final note =
                    otherNotes[index];

                    return NoteCard(

                      note: note,

                      onDelete: () {

                        controller
                            .deleteNote(
                          controller.notes
                              .indexOf(note),
                        );
                      },

                      onPin: () {

                        controller
                            .togglePin(
                          controller.notes
                              .indexOf(note),
                        );
                      },

                      onTap: () {

                        Get.to(
                              () => AddNoteScreen(
                            note: note,
                            index: controller
                                .notes
                                .indexOf(note),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}