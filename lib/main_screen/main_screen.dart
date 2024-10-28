import 'package:elementary_test/main_screen/counter_page/counter_page.dart';
import 'package:elementary_test/main_screen/with_bloc_page/with_bloc_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ETabType {
  counter,
  withBloc;

  Icon get icon => switch (this) {
        counter => const Icon(Icons.plus_one),
        withBloc => const Icon(Icons.square_rounded),
      };

  String get label => switch (this) {
        counter => 'counter',
        withBloc => 'with BLoC',
      };

  Widget get tab => switch (this) {
        counter => const CounterPage(),
        withBloc => const WithBlocPage(),
      };
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ETabType currentTab = ETabType.counter;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        border: null,
        backgroundColor: Colors.grey,
        onTap: (int index) {
          setState(() => currentTab = ETabType.values[index]);
        },
        inactiveColor: Colors.white54,
        items: ETabType.values
            .map((e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.label,
                ))
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return currentTab.tab;
      },
    );
  }
}
