import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String username;
  final String description;

  const DiaryCard(
      {super.key,
      required this.title,
      required this.username,
      required this.description});

  @override
  State<DiaryCard> createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  bool _showMore = false;

  void _toggleShowMore() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    String truncatedDescription = widget.description;
    if (widget.description.length > 100) {
      truncatedDescription = _showMore
          ? widget.description
          : '${widget.description.substring(0, 100)}...';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.username,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  truncatedDescription,
                  style: const TextStyle(fontSize: 16.0),
                ),
                if (widget.description.length > 100)
                  TextButton(
                    onPressed: _toggleShowMore,
                    child: Text(
                      _showMore ? 'Hide' : 'SHOW MORE',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
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
