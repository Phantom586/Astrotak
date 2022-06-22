import 'package:astrotak/presentation/screens/profile/tab_order_history.dart';
import 'package:astrotak/presentation/screens/profile/tab_my_profile.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Image.asset('assets/icons/back.png'),
            ),
          ),
          leadingWidth: size.width * 0.09,
          title: Image.asset(
            'assets/icons/icon.png',
            width: size.width * 0.15,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    'Logout',
                    style: p2_paragraph.copyWith(color: secondaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            TabBar(
                labelColor: secondaryColor,
                labelStyle: p1_paragraph.copyWith(color: secondaryColor),
                unselectedLabelStyle: p1_paragraph,
                unselectedLabelColor: Colors.black87,
                indicatorColor: secondaryColor,
                tabs: const [
                  Tab(
                    child: Text(
                      'My Profile',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Order History',
                    ),
                  ),
                ]),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TabBarView(
                children: [TabMyProfile(), TabOrderHistory()],
              ),
            )),
          ],
        )),
      ),
    );
  }
}
