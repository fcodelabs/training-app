import 'package:flutter/material.dart';

class DiaryCardView extends StatefulWidget {
  final String title;
  final String username;
  final String description;

  const DiaryCardView(
      {super.key,
      required this.title,
      required this.username,
      required this.description});

  @override
  DiaryCardState createState() => DiaryCardState();
}

class DiaryCardState extends State<DiaryCardView> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    String displayedDescription = widget.description;
    if (widget.description.length > 100 && !showMore) {
      displayedDescription = "${widget.description.substring(0, 100)}...";
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set border radius here
      ),
      color: Colors.blue[200], // Set background color here
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              widget.username,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              displayedDescription,
              style: const TextStyle(
                  color: Colors.black, fontSize: 15), // Set text color here
            ),
          ),
          if (widget.description.length > 100)
            InkWell(
              onTap: () {
                setState(() {
                  showMore = !showMore;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  showMore ? 'Hide' : 'Show More',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold, // Set text color here
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}