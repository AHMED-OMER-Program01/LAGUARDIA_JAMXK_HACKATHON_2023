import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jamxk/home/bloc/home_bloc.dart';

class AppBottonBar extends StatelessWidget {
  final int currentIndex;
  const AppBottonBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteBg,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: coral,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(
                          IndexChangedEvent(selectedIndex: 0),
                        );
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(faceIdImage),
                  )),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        IndexChangedEvent(selectedIndex: 1),
                      );
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(addIcon),
                ),
              ),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        IndexChangedEvent(selectedIndex: 2),
                      );
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(transfersIcon),
                ),
              ),
              label: 'Payroll',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        IndexChangedEvent(selectedIndex: 3),
                      );
                },
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(profileIcon),
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
