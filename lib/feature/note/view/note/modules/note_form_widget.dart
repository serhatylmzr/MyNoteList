part of '../note_view.dart';

class _NoteForm extends StatelessWidget {
  final NoteViewModel viewModel;
  const _NoteForm({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTitleInput(viewModel.titleTextController,
                viewModel.noteCubit.state.noteTheme.textColor),
            _buildContentInput(viewModel.contentTextController,
                viewModel.noteCubit.state.noteTheme.textColor),
          ],
        ),
      ),
    );
  }
}

TextFieldWidget _buildContentInput(
        TextEditingController controller, int color) =>
    TextFieldWidget(
      controller: controller,
      hintText: LocaleKeys.notes_note_note_content.locale,
      maxLines: 20,
      style: TextStyle(color: Color(color)),
      cursorColor: Color(color),
    );

TextFieldWidget _buildTitleInput(TextEditingController controller, int color) =>
    TextFieldWidget(
      controller: controller,
      hintText: LocaleKeys.notes_note_note_title.locale,
      style: TextStyle(color: Color(color)),
      cursorColor: Color(color),
    );
