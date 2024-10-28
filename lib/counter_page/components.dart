part of 'counter_page.dart';

class _IncrementButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;

  const _IncrementButton({
    required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(iconData),
    );
  }
}

class _CounterText extends StatelessWidget {
  final String value;

  const _CounterText({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
