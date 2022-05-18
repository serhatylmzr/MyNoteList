part of '../note_list_view.dart';

class _GridViewBuilderWidget extends StatelessWidget {
  final NoteListViewModel viewModel;
  final List<NoteModel>? noteList;
  const _GridViewBuilderWidget(
      {Key? key, required this.viewModel, required this.noteList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double axisSpacing = 10;
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: axisSpacing,
      crossAxisSpacing: axisSpacing,
      itemCount: noteList?.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: _GridCardItem(
            viewModel: viewModel,
            note: noteList?[index],
            index: index,
          ),
        );
      },
    );
  }
}
