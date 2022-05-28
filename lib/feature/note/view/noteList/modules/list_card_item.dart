part of '../note_list_view.dart';

class _ListCardItem extends StatelessWidget {
  final NoteListViewModel viewModel;
  final NoteModel note;
  final int index;
  const _ListCardItem(
      {Key? key,
      required this.viewModel,
      required this.note,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            viewModel.navigateNoteDetail([note]);
          },
          child: Dismissible(
            key: Key(note.noteId),
            direction: DismissDirection.endToStart,
            background: const _DeleteContainerWidget(),
            onDismissed: (direction) =>
                context.read<NoteCubit>().deleteNote(note.noteId),
            child: Container(
              padding: context.paddingLow,
              height: 120,
              width: size.width,
              decoration: buildBoxDecoration(note.noteTheme.background),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: _buildNoteTitle(context)),
                      _NoteCategoryContainer(
                        text: note.category.category,
                        color: note.category.color,
                        textColor: note.noteTheme.textColor,
                      ),
                    ],
                  ),
                  context.emptySizedHeightBoxLow,
                  Expanded(
                    child: _buildNoteContent(context),
                  ),
                  context.emptySizedHeightBoxNormal,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: _buildNoteDate(context)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Text _buildNoteContent(BuildContext context) {
    return Text(
      note.body,
      style: context.textTheme.bodyText1?.copyWith(
          color: Color(note.noteTheme.textColor),
          overflow: TextOverflow.ellipsis),
      maxLines: 3,
    );
  }

  Text _buildNoteTitle(BuildContext context) {
    return Text(
      note.title,
      style: context.textTheme.headline3?.copyWith(
          color: Color(note.noteTheme.textColor),
          overflow: TextOverflow.ellipsis),
      maxLines: 1,
    );
  }

  CustomText _buildNoteDate(BuildContext context) {
    return CustomText(
      text: note.created.timetoString,
      style: context.textTheme.bodyText1
          ?.copyWith(color: Color(note.noteTheme.textColor)),
    );
  }
}
