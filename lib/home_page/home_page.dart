import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'components.dart';
part 'model.dart';
part 'widget_model.dart';

class HomePage extends ElementaryWidget<TestPageWidgetModel> {
  const HomePage({
    Key? key,
    WidgetModelFactory wmFactory = testPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(TestPageWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elementary Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter:'),
            ValueListenableBuilder<bool>(
              valueListenable: wm.calculatingState,
              builder: (_, isCalculating, __) {
                return isCalculating
                    ? const CircularProgressIndicator()
                    : ValueListenableBuilder<String>(
                        valueListenable: wm.valueState,
                        builder: (_, value, __) {
                          return _CounterText(
                            value: value,
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: wm.calculatingState,
        builder: (_, isCalculating, __) {
          return isCalculating
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _IncrementButton(
                      iconData: Icons.sync_problem,
                    ),
                    SizedBox(height: 8),
                    _IncrementButton(
                      iconData: Icons.sync_problem,
                    ),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _IncrementButton(
                      onPressed: wm.increment,
                      iconData: Icons.add,
                    ),
                    const SizedBox(height: 8),
                    _IncrementButton(
                      onPressed: wm.decrement,
                      iconData: Icons.remove,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
