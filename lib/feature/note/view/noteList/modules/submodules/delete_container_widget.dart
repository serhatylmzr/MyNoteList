part of '../../note_list_view.dart';

class _DeleteContainerWidget extends StatelessWidget {
  const _DeleteContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _borderRadius = BorderRadius.circular(10);
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              context.theme.colorScheme.secondaryContainer,
              context.theme.colorScheme.onSecondaryContainer
            ],
          ),
          borderRadius: _borderRadius),
      child: Padding(
        padding: context.paddingRightMedium,
        child: const Icon(
          Icons.delete_sweep_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
