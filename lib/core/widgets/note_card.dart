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

        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: const [

            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                Expanded(

                  child: Text(

                    note.title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),

                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                IconButton(

                  onPressed: onPin,

                  icon: Icon(

                    note.isPinned
                        ? Icons.push_pin
                        : Icons.push_pin_outlined,

                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(

              note.content,

              maxLines: 3,

              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            Align(

              alignment: Alignment.centerRight,

              child: IconButton(

                onPressed: onDelete,

                icon: const Icon(
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