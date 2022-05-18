import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../viewmodel/note_view_model.dart';
import '../../../../product/extension/color_extension.dart';
import '../../../../product/widget/text/locale_text.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/init/lang/locale_keys.g.dart';
import '../../../../product/widget/decoration/box_decoration.dart';
import '../../../../product/widget/field/textfield_widget.dart';
import '../../cubit/note_cubit.dart';
import '../../model/note_theme/note_theme_model.dart';
part 'modules/note_form_widget.dart';
part 'modules/category_widget.dart';
part 'modules/note_theme_widget.dart';
part 'modules/cancel_button.dart';
part 'modules/save_note_button.dart';
part 'modules/submodules/note_theme_circle_widget.dart';
part 'modules/submodules/category_circle_widget.dart';
part 'modules/submodules/modal_select_category.dart';
part 'modules/submodules/item_category_widget.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NoteViewModel>(
        viewModel: NoteViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onDispose: (model) {
          model.onDispose();
        },
        onPageBuilder: (context, _viewModel) =>
            _buildScafold(context, _viewModel));
  }

  BlocBuilder _buildScafold(BuildContext context, NoteViewModel _viewModel) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return Container(
          decoration: buildBoxDecoration(
              _viewModel.noteCubit.state.noteTheme.background),
          child: Scaffold(
            backgroundColor:
                context.theme.scaffoldBackgroundColor.withOpacity(0.0),
            appBar: _buildAppbar(context, _viewModel),
            body: _buildBody(context, _viewModel),
          ),
        );
      },
    );
  }

  SafeArea _buildBody(BuildContext context, NoteViewModel _viewModel) {
    return SafeArea(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            SizedBox(
              height: context.isKeyBoardOpen
                  ? context.height * 0.73 - context.keyboardSize
                  : context.height * 0.73,
              child: _NoteForm(
                viewModel: _viewModel,
              ),
            ),
            // context.emptySizedHeightBoxNormal,
            _NoteThemeWidget(
              viewModel: _viewModel,
            ),
            context.emptySizedHeightBoxNormal,
            _CategoryWidget(viewModel: _viewModel)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context, NoteViewModel _viewModel) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      title: _pageTitle(context),
      centerTitle: true,
      leading: _CancelNoteButton(onPressed: (() => _viewModel.cancelNote())),
      actions: [_SaveNoteButton(onPressed: () => _viewModel.saveNote())],
    );
  }
}

LocaleText _pageTitle(BuildContext context) => LocaleText(
    text: LocaleKeys.notes_note_add_note, style: context.textTheme.headline2);
