import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TabOrderHistory extends StatelessWidget {
  const TabOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Order History',
              style: p1_paragraph,
            )
          ],
        ),
      ),
    );
  }
}
