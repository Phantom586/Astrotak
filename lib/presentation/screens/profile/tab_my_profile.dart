import 'package:astrotak/presentation/screens/profile/tab_friends_family.dart';
import 'package:astrotak/presentation/screens/profile/tab_basic_profile.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TabMyProfile extends StatefulWidget {
  const TabMyProfile({Key? key}) : super(key: key);

  @override
  State<TabMyProfile> createState() => _TabMyProfileState();
}

class _TabMyProfileState extends State<TabMyProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            labelStyle: p1_paragraph.copyWith(color: Colors.white),
            unselectedLabelStyle: p1_paragraph,
            unselectedLabelColor: Colors.black87,
            indicatorColor: secondaryColor,
            indicator: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(5.0)),
            tabs: const [
              Tab(
                child: Text('Basic Profile'),
              ),
              Tab(
                child: Text('Friends and Family'),
              ),
            ]),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [TabBasicProfile(), TabFriendsAndFamily()],
          ),
        ),
      ]),
    );
  }
}
