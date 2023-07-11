import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_bloc.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_event.dart';
import 'package:training_app/ui/widgets/diary_card/diary_card_state.dart';

class DiaryCardView extends StatelessWidget {
  final bool showMore = false;

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
  Widget build(BuildContext context) {
    bool showMoreOption = description.length > 5;

    return BlocProvider(
      create: (context) => DiaryCardBloc(),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4,
          color: const Color.fromARGB(255, 141, 204, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlocBuilder<DiaryCardBloc, DiaryCardState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.isPressed
                          ? description
                          : description.length > 5
                              ? "${description.substring(0, 5)}..."
                              : description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (showMoreOption)
                      InkWell(
                        onTap: () {
                          context
                              .read<DiaryCardBloc>()
                              .add(ShowMoreButtonPressed(description));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              state.isPressed ? "Show less" : "Show more",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
