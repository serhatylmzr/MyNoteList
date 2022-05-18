part of '../note_list_view.dart';

class _ChangeGridButton extends StatelessWidget {
  const _ChangeGridButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<NoteCubit>().changelistToGrid();
          },
          padding: context.paddingRightMedium,
          icon: state.isGrid
              ? const Icon(Icons.table_rows)
              : const Icon(Icons.grid_view_rounded),
        );
      },
    );
  }
}
