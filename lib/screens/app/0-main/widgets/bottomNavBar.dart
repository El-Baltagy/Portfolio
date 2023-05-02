import 'package:flutter/material.dart';

import '../../../../shared/widgets/navbar_actions_button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 15),
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           NavBarActionButton(24),
        ],
      ),
    );
  }
}
