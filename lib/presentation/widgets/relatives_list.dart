import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:astrotak/data/models/relatives.dart';
import 'package:flutter/material.dart';

class RelativesList extends StatelessWidget {
  const RelativesList(
      {Key? key, required this.controller, required this.allRelatives})
      : super(key: key);

  final List<AllRelatives> allRelatives;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: allRelatives.length,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        allRelatives[index].fullName!,
                        style: p2_paragraph,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        allRelatives[index].dateAndTimeOfBirth!,
                        style: p2_paragraph,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        allRelatives[index].firstName!,
                        style: p2_paragraph,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        allRelatives[index].relation!,
                        style: p2_paragraph,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/icons/edit.png',
                            width: 16.0,
                          ),
                          Image.asset(
                            'assets/icons/delete.png',
                            width: 16.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
