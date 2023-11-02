import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weightin/src/presentation/blocs/blocs.dart';

class MainBotNavBar extends StatelessWidget {
  const MainBotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavbarCubit navbarCubit = context.read<NavbarCubit>();

    return BlocBuilder<NavbarCubit, int>(
      bloc: navbarCubit,
      builder: (
        context,
        state,
      ) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (index) {
            navbarCubit.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        );
      },
    );
  }
}
