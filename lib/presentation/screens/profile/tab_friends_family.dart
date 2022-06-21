import 'package:astrotak/presentation/screens/profile/bottomsheet/add_member.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TabFriendsAndFamily extends StatefulWidget {
  const TabFriendsAndFamily({Key? key}) : super(key: key);

  @override
  State<TabFriendsAndFamily> createState() => _TabFriendsAndFamilyState();
}

class _TabFriendsAndFamilyState extends State<TabFriendsAndFamily> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/wallet.png',
                  width: 24.0,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Wallet Balance : ₹0',
                  style: p1_paragraph.copyWith(color: primaryColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black)),
                    child: Text(
                      'Add Money',
                      style: p3_bold_paragraph.copyWith(color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Name',
                  style: p2_paragraph.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Text(
                  'DOB',
                  style: p2_paragraph.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Text(
                  'TOB',
                  style: p2_paragraph.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                Text(
                  'Relation',
                  style: p2_paragraph.copyWith(color: primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Mohit Kr',
                              style: p2_paragraph,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '11-8-1994',
                              style: p2_paragraph,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '8:30',
                              style: p2_paragraph,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Brother',
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
          ),
          TextButton.icon(
              style: TextButton.styleFrom(backgroundColor: secondaryColor),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return const AddMember();
                    });
              },
              icon: const Icon(
                Icons.add,
                size: 16.0,
                color: Colors.white,
              ),
              label: Text(
                'Add New Profile',
                style: p2_paragraph.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
