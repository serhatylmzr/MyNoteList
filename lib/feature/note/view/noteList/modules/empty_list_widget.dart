part of '../note_list_view.dart';

class _EmptyListWidget extends StatelessWidget {
  const _EmptyListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          context.spacer,
          context.dynamicExpanded(3,
              _buildSvgPicture(ImageConstants.instance.svgPath.noteNotFound)),
          context.spacer,
          context.dynamicExpanded(
            3,
            LocaleText(
                text: LocaleKeys.notes_note_add_new_note.locale,
                style: context.textTheme.headline2),
          )
        ],
      ),
    );
  }
}

SvgPicture _buildSvgPicture(String path) => SvgPicture.asset(path);
