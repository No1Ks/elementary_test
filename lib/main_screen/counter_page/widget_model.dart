part of 'counter_page.dart';

CounterPageWidgetModel counterPageWidgetModelFactory(BuildContext context) {
  return CounterPageWidgetModel(CounterPageModel());
}

class CounterPageWidgetModel extends WidgetModel<CounterPage, CounterPageModel> {
  late ValueNotifier<String> _valueController;

  late final _calculatingController = ValueNotifier<bool>(false);

  ValueListenable<String> get valueState => _valueController;

  ValueListenable<bool> get calculatingState => _calculatingController;

  CounterPageWidgetModel(CounterPageModel model) : super(model);

  Future<void> increment() async {
    _calculatingController.value = true;

    final newVal = await model.increment();
    _valueController.value = newVal.toString();

    _calculatingController.value = false;
  }

  Future<void> decrement() async {
    _calculatingController.value = true;

    final newVal = await model.decrement();
    _valueController.value = newVal.toString();

    _calculatingController.value = false;
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _valueController = ValueNotifier<String>(model.value.toString());
  }

  @override
  void dispose() {
    _valueController.dispose();
    _calculatingController.dispose();

    super.dispose();
  }
}
