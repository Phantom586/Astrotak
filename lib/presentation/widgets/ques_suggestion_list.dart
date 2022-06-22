import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class QuesSuggestionList extends StatelessWidget {
  const QuesSuggestionList(
      {Key? key,
      required this.controller,
      required this.width,
      required this.suggestionsList})
      : super(key: key);

  final List<String> suggestionsList;
  final ScrollController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: controller,
        itemCount: suggestionsList.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
          );
        },
        itemBuilder: (context, index) {
          return SizedBox(
            width: width,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/question.png',
                  width: 16.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  suggestionsList[index],
                  style: p1_paragraph,
                ))
              ],
            ),
          );
        });
  }
}
