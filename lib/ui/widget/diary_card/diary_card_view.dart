import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:training_app/ui/widget/diary_card/diary_card_bloc.dart';
import 'package:training_app/ui/widget/diary_card/diary_card_event.dart';
import 'package:training_app/ui/widget/diary_card/diary_card_state.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String username;
  final String description;

  const DiaryCard({
    Key? key,
    required this.title,
    required this.username,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiaryCardBloc>(
      create: (context) => DiaryCardBloc(),
      child: BlocBuilder<DiaryCardBloc, DiaryCardState>(
        builder: (context, state) {
          String truncatedDescription = description;
          if (description.length > 100) {
            truncatedDescription =
                state.showMore ? description : '${description.substring(0, 100)}...';
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
                      title,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      username,
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
                    if (description.length > 100)
                      TextButton(
                        onPressed: () {
                          context.read<DiaryCardBloc>().add(
                                ToggleShowMore(showMore: !state.showMore),
                              );
                        },
                        child: Text(
                          state.showMore ? 'Hide' : 'SHOW MORE',
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
        },
      ),
    );
  }
}
