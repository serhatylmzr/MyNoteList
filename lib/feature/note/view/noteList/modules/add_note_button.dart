part of '../note_list_view.dart';

class _AddNoteButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddNoteButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _buildButtonDesign(context),
    );
  }

  Container _buildButtonDesign(BuildContext context) {
    const double _size = 50;
    return Container(
      height: _size,
      width: _size,
      decoration: _buildDecoration(context),
      child: _buildIcon(),
    );
  }

  Icon _buildIcon() {
    return const Icon(
      Icons.add,
      color: Colors.white,
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.theme.canvasColor,
      shape: BoxShape.circle,
    );
  }
}
