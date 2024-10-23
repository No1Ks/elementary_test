part of 'home_page.dart';

class TestPageModel extends ElementaryModel {
  var _value = 0;

  int get value => _value;

  TestPageModel();

  Future<int> increment() async {
    // In academic purpose emulate a process that takes some time.
    await Future<void>.delayed(const Duration(seconds: 1));

    return ++_value;
  }

  Future<int> decrement() async {
    // In academic purpose emulate a process that takes some time.
    await Future<void>.delayed(const Duration(seconds: 1));

    if (_value > 0) {
      _value--;
    }

    return _value;
  }
}
