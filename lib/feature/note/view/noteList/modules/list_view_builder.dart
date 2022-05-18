part of '../note_list_view.dart';

class _ListViewBuilderWidget extends StatelessWidget {
  final List<NoteModel>? noteList;
  const _ListViewBuilderWidget({Key? key, required this.noteList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: context.dynamicHeight(0.01));
        },
        itemCount: noteList?.length ?? 1,
        itemBuilder: (BuildContext context, int index) {
          return _ListCardItem(
            note: noteList?[index],
            index: index,
          );
        });
  }
}
