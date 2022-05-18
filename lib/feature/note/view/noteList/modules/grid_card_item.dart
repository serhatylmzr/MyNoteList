part of '../note_list_view.dart';

class _GridCardItem extends StatelessWidget {
  final NoteListViewModel viewModel;
  final NoteModel? note;
  final int index;
  const _GridCardItem(
      {Key? key,
      required this.viewModel,
      required this.index,
      required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            viewModel.navigateNoteDetail([note, index]);
          },
          child: Dismissible(
            key: Key(produceRandomDeleteKey(index)),
            direction: DismissDirection.endToStart,
            background: const _DeleteContainerWidget(),
            onDismissed: (direction) =>
                context.read<NoteCubit>().deleteNote(index),
            child: _buildNoteContainer(context),
          ),
        );
      },
    );
  }

  Container _buildNoteContainer(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      decoration: buildBoxDecoration(note!.noteTheme.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNoteTitle(context),
          context.emptySizedHeightBoxLow,
          _buildNoteContent(context),
          context.emptySizedHeightBoxNormal,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNoteDate(context),
              _NoteCategoryContainer(
                text: note!.category.category,
                color: note!.category.color,
                textColor: note!.noteTheme.textColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  CustomText _buildNoteDate(BuildContext context) {
    return CustomText(
      text: note?.created.timetoString,
      style: context.textTheme.bodyText1
          ?.copyWith(color: Color(note!.noteTheme.textColor)),
    );
  }

  Text _buildNoteContent(BuildContext context) {
    return Text(
      note?.body ?? '',
      style: context.textTheme.bodyText1
          ?.copyWith(color: Color(note!.noteTheme.textColor)),
      overflow: TextOverflow.ellipsis,
      maxLines: 10,
    );
  }

  Text _buildNoteTitle(BuildContext context) {
    return Text(
      note?.title ?? '',
      style: context.textTheme.headline3
          ?.copyWith(color: Color(note!.noteTheme.textColor)),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

String produceRandomDeleteKey(int index) {
  final int intValue = Random().nextInt(1000) * (index + 1);
  return intValue.toString();
}
