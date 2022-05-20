import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/constants/app_constants.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.setTicker(this);
          model.init();
        },
        onDispose: (model) {
          model.onDispose();
        },
        onPageBuilder: (context, viewModel) =>
            buildScafold(context, viewModel));
  }

  Scaffold buildScafold(BuildContext context, SplashViewModel _viewModel) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAppLogo(context, _viewModel),
                  context.emptySizedHeightBoxMedium,
                  _buildAppTitle(context),
                  _buildLoadingAnimation(context, _viewModel)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildAppTitle(BuildContext context) {
    return Text(
      ApplicationConstants.appTitle,
      style: context.textTheme.headline1,
    );
  }

  Image _buildAppLogo(BuildContext context, SplashViewModel _viewModel) {
    return Image.asset(
      _viewModel.imageConstants.pngPath.appLogo,
      width: context.dynamicWidth(0.3),
      height: context.dynamicHeight(0.2),
    );
  }

  Widget _buildLoadingAnimation(
      BuildContext context, SplashViewModel _viewModel) {
    return SizedBox(
      child: Lottie.asset(
        _viewModel.imageConstants.lottiePath.loading,
        controller: _viewModel.animationController,
        width: context.dynamicHeight(0.3),
        fit: BoxFit.contain,
        onLoaded: (composition) {
          _viewModel.animationController
            ..duration = composition.duration
            ..forward()
            ..repeat();
          _viewModel.cacheControl();
        },
      ),
    );
  }
}
