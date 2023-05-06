import 'package:flutter/material.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:flutter_svg/svg.dart';

class AppBottonBar extends StatelessWidget {
  const AppBottonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteBg,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: coral,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(carbon),
              ),
              label: 'My Carbon',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(paymentsIcon),
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(transfersIcon),
              ),
              label: 'Other',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(profileIcon),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
