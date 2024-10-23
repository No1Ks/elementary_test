part of 'home_page.dart';

TestPageWidgetModel testPageWidgetModelFactory(BuildContext context) {
  return TestPageWidgetModel(TestPageModel());
}

class TestPageWidgetModel extends WidgetModel<HomePage, TestPageModel> {
  late ValueNotifier<String> _valueController;
  late final _calculatingController = ValueNotifier<bool>(false);

  ValueListenable<String> get valueState => _valueController;

  ValueListenable<bool> get calculatingState => _calculatingController;

  TestPageWidgetModel(TestPageModel model) : super(model);

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
