import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_card_bloc.dart';
import 'diary_card_event.dart';
import 'diary_card_state.dart';

class DiaryCardView extends StatelessWidget {
  final String title;
  final String username;
  final String description;

  const DiaryCardView({
    Key? key,
    required this.title,
    required this.username,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryCardBloc(),
      child: BlocBuilder<DiaryCardBloc, DiaryCardState>(
        builder: (context, state) {
          bool showMore = false;
          showMore = state.showMore;

          String displayedDescription = description;
          if (description.length > 100 && !showMore) {
            displayedDescription = "${description.substring(0, 100)}...";
          }

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.blue[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    username,
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
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                if (description.length > 100)
                  InkWell(
                    onTap: () {
                      // Dispatch the ToggleShowMoreEvent to the DiaryCardBloc
                      context.read<DiaryCardBloc>().add(ToggleShowMoreEvent());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        showMore ? 'Hide' : 'Show More',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
