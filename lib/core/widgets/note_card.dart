import 'package:flutter/material.dart';

import '../../data/models/note_model.dart';

class NoteCard extends StatelessWidget {

  final Note note;

  final VoidCallback onDelete;

  final VoidCallback onPin;

  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onPin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [

            BoxShadow(

              color: Colors.black.withOpacity(0.05),

              blurRadius: 10,

              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          mainAxisSize: MainAxisSize.min,

          children: [

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                Expanded(

                  child: Text(

                    note.title,

                    maxLines: 1,

                    overflow:
                    TextOverflow.ellipsis,

                    style: const TextStyle(

                      fontSize: 20,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                GestureDetector(

                  onTap: onPin,

                  child: Icon(

                    note.isPinned
                        ? Icons.push_pin
                        : Icons.push_pin_outlined,

                    size: 20,

                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(

              height: 1.2,

              width: double.infinity,

              color: Colors.grey.shade300,
            ),

            const SizedBox(height: 12),

            Text(

              note.content,

              maxLines: 6,

              overflow:
              TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 14),

            Align(

              alignment:
              Alignment.bottomRight,

              child: GestureDetector(

                onTap: onDelete,

                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}