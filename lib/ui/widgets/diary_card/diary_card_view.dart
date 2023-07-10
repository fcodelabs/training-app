import 'package:flutter/material.dart';

class DiaryCardView extends StatefulWidget {
  final String title;
  final String description;
  final String username;

  const DiaryCardView({
    Key? key,
    required this.username,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<DiaryCardView> createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCardView> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    String descriptionText = showMore
        ? widget.description
        : widget.description.length > 5
            ? "${widget.description.substring(0, 5)}..."
            : widget.description;
    bool showMoreOption = widget.description.length > 5;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 141, 204, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.username,
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
              if (showMoreOption)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  child: Text(showMore ? 'Show Less' : 'Show More'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
