import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:weightin/src/presentation/blocs/blocs.dart';
import 'package:weightin/src/presentation/widgets/widgets.dart';

import 'account_screen.dart';
import 'history_screen.dart';
import 'statistic_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavbarCubit navbarCubit = context.read<NavbarCubit>();

    return Scaffold(
      body: _bodyBuilder(navbarCubit),
      floatingActionButton: _fabBuilder(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const MainBotNavBar(),
    );
  }

  BlocBuilder _bodyBuilder(NavbarCubit navbarCubit) {
    const List<Widget> _pageView = [
      StatisticScreen(),
      HistoryScreen(),
      AccountScreen(),
    ];

    return BlocBuilder<NavbarCubit, int>(
      bloc: navbarCubit,
      builder: (context, state) {
        return _pageView.elementAt(state);
      },
    );
  }

  FloatingActionButton _fabBuilder(BuildContext context) {
    WeightCubit weightCubit = context.read<WeightCubit>();
    return FloatingActionButton.extended(
      tooltip: 'Add record',
      label: const Text('Add a new record'),
      onPressed: () {
        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(now);

        weightCubit.isEdit = false;
        weightCubit.isSuccess = false;
        weightCubit.weightController.text = '';
        weightCubit.dateController.text = formatted.toString();
        context.push('/add-edit-weight');
      },
    );
  }
}
