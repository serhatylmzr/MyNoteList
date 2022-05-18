part of '../../note_view.dart';

class _CategoryCircleWidget extends StatelessWidget {
  final Color color;
  const _CategoryCircleWidget({Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _mediumSize = 18;
    const double _borderWith = 4.0;
    return Container(
      height: _mediumSize,
      width: _mediumSize,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: _borderWith),
        borderRadius: context.veryLowCircularRadius,
      ),
    );
  }
}
