import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../cubit/note_cubit.dart';
import '../../../setting/view/setting_view.dart';
import '../../../../product/constants/image_constants.dart';
import '../../../../product/extension/date_extension.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/list_extension.dart';
import '../../../../product/init/lang/locale_keys.g.dart';
import '../../../../product/widget/decoration/box_decoration.dart';
import '../../../../product/widget/field/search_textfield_widget.dart';
import '../../../../product/widget/text/custom_text.dart';
import '../../../../product/widget/text/locale_text.dart';
import '../../model/note/note_model.dart';
import '../../viewmodel/note_list_view_model.dart';
part 'modules/grid_view_builder.dart';
part 'modules/list_view_builder.dart';
part 'modules/grid_card_item.dart';
part 'modules/list_card_item.dart';
part 'modules/empty_list_widget.dart';
part 'modules/add_note_button.dart';
part 'modules/change_grid_button.dart';
part 'modules/setting_button.dart';
part 'modules/submodules/note_category.dart';
part 'modules/submodules/delete_container_widget.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NoteListViewModel>(
        viewModel: NoteListViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onDispose: (model) {
          model.onDispose();
        },
        onPageBuilder: (context, viewModel) =>
            _buildScaffold(context, viewModel));
  }

  Scaffold _buildScaffold(BuildContext context, NoteListViewModel _viewModel) {
    return Scaffold(
      floatingActionButton: _AddNoteButton(
        onTap: () => _viewModel.navigateAddNote(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: _buildAppBar(_viewModel, context),
      drawer: const SettingView(),
      body: _buildBody(context, _viewModel),
    );
  }

  AppBar _buildAppBar(NoteListViewModel _viewModel, BuildContext context) {
    return AppBar(
      leading: const _SettingButton(),
      shape: RoundedRectangleBorder(
        borderRadius: context.mediumCircularRadius,
      ),
      automaticallyImplyLeading: true,
      backgroundColor: context.theme.appBarTheme.backgroundColor,
      elevation: 0,
      title: const SearchBar(),
      actions: const [
        _ChangeGridButton(),
      ],
    );
  }

  Widget _buildBody(BuildContext context, NoteListViewModel _viewModel) {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: context.paddingNormal,
                child: BlocConsumer<NoteCubit, NoteState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.noteList.isNullOrEmpty == true) {
                      return const _EmptyListWidget();
                    }
                    return state.isGrid
                        ? _GridViewBuilderWidget(
                            viewModel: _viewModel,
                            noteList: state.noteList,
                          )
                        : _ListViewBuilderWidget(
                            noteList: state.noteList,
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
