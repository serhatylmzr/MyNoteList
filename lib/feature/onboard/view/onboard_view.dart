import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotelist/core/extensions/string_extension.dart';
import '../../../core/extensions/context_extension.dart';
import '../../setting/cubit/setting_cubit.dart';
import '../../../product/widget/text/locale_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/base/view/base_view.dart';
import '../model/onboard_model.dart';
import '../viewmodel/onboard_view_model.dart';
part 'modules/skip_button.dart';
part 'modules/onboard_circle.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
        viewModel: OnboardViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onDispose: (model) {
          model.onDispose();
        },
        onPageBuilder: (context, viewModel) =>
            _buildScafold(context, viewModel));
  }

  Scaffold _buildScafold(BuildContext context, OnboardViewModel _viewModel) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: _buildBody(context, _viewModel),
    );
  }

  Padding _buildBody(BuildContext context, OnboardViewModel _viewModel) {
    return Padding(
      padding: context.paddingSymmetricNormalHorizontal,
      child: Column(
        children: [
          context.spacer,
          context.dynamicExpanded(5, _buildPageView(_viewModel)),
          context.dynamicExpanded(2, _buildRowFooter(_viewModel, context))
        ],
      ),
    );
  }

  PageView _buildPageView(OnboardViewModel _viewModel) {
    return PageView.builder(
        itemCount: _viewModel.onBoardItems.length,
        onPageChanged: (value) {
          _viewModel.changeCurrentIndex(value);
        },
        itemBuilder: (context, index) =>
            _buildColumnBody(context, _viewModel.onBoardItems[index]));
  }

  Row _buildRowFooter(OnboardViewModel _viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildListViewCircles(_viewModel),
        Expanded(child: Center(child:
            BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
          return Visibility(
              visible: state.isLoading,
              child: const CircularProgressIndicator());
        }))),
        _SkipButton(onPressed: () => _viewModel.completeToOnBoard()),
      ],
    );
  }

  ListView _buildListViewCircles(OnboardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
          return _OnBoardCircle(
            isSelected: state.currentIndex == index,
          );
        });
      },
    );
  }

  Column _buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: _buildSvgPicture(model.imagePath)),
        _buildColumnDescription(context, model),
      ],
    );
  }

  Column _buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Padding(
          padding: context.paddingBottomNormal,
          child: _buildTextTitle(model, context),
        ),
        Padding(
            padding: context.paddingSymmetricNormalHorizontal,
            child: _buildTextDescription(model, context))
      ],
    );
  }

  LocaleText _buildTextTitle(OnBoardModel model, BuildContext context) {
    return LocaleText(
      text: model.title,
      style: context.textTheme.headline2,
    );
  }

  AutoSizeText _buildTextDescription(OnBoardModel model, BuildContext context) {
    return AutoSizeText(
      model.description.locale,
      style: context.textTheme.bodyText1?.copyWith(
        fontSize: 15,
      ),
    );
  }

  SvgPicture _buildSvgPicture(String path) => SvgPicture.asset(path);
}
