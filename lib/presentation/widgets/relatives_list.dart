import 'package:astrotak/logic/bloc/relatives_bloc.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:astrotak/data/models/relatives.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          allRelatives[index].fullName!,
                          style: p2_paragraph,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        allRelatives[index].dateAndTimeOfBirth!.split('T0')[0],
                        style: p2_paragraph,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          allRelatives[index]
                              .dateAndTimeOfBirth!
                              .split('T0')[1],
                          style: p2_paragraph,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          allRelatives[index].relation!,
                          style: p2_paragraph,
                        ),
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
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Do you really want to Delete ${allRelatives[index].fullName}?',
                                              textAlign: TextAlign.center,
                                              style: h2_heading.copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            secondaryColor,
                                                      ),
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                RelativesBloc>()
                                                            .add(DeleteRelative(
                                                                uuid: allRelatives[
                                                                        index]
                                                                    .uuid!));
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('YES',
                                                          style: p1_paragraph
                                                              .copyWith(
                                                            color: Colors.white,
                                                          ))),
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            secondaryColor,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('NO',
                                                          style: p1_paragraph
                                                              .copyWith(
                                                            color: Colors.white,
                                                          ))),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Image.asset(
                              'assets/icons/delete.png',
                              width: 16.0,
                            ),
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
