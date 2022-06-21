import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Talk extends StatelessWidget {
  const Talk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/icons/hamburger.png'),
        ),
        leadingWidth: size.width * 0.09,
        title: Image.asset(
          'assets/icons/icon.png',
          width: size.width * 0.15,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/icons/profile.png',
              width: size.width * 0.06,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/illus/talk.png',
              width: size.width * 0.35,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Let\'s Talk about something!',
              style: h1_heading,
            ),
          ],
        ),
      )),
    );
  }
}
