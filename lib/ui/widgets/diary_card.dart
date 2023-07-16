import 'package:flutter/material.dart';
import 'package:training_app/db/model/diary.dart';

class DiaryCard extends StatefulWidget {
  final Diary diary;
  final String name;

  const DiaryCard({
    Key? key,
    required this.diary,
    required this.name,
  }) : super(key: key);

  @override
  State<DiaryCard> createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    String descriptionText = showMore
        ? widget.diary.description
        : widget.diary.description.length > 100
            ? "${widget.diary.description.substring(0, 100)}..."
            : widget.diary.description;
    bool showMoreOption = widget.diary.description.length > 100;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: widget.name == widget.diary.username
            ? const Color.fromARGB(255, 0, 145, 255)
            : const Color.fromARGB(255, 0, 179, 219),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.diary.title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.diary.username,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 75, 75, 75),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                descriptionText,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              if (showMoreOption)
                InkWell(
                  onTap: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Text(
                    showMore ? 'Show Less' : 'Show More',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 16, 62, 100),
                      fontSize: 16,
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
