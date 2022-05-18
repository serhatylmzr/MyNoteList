part of '../setting_view.dart';

class _LanguageButton extends StatelessWidget {
  final SettingViewModel viewModel;
  const _LanguageButton({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: context.paddingRightNormal,
          child: LocaleText(
              text: context
                  .watch<SettingCubit>()
                  .state
                  .locale
                  ?.languageCode
                  .getLangFullName)),
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black54,
          pageBuilder: (context, animationFirst, animationSecond) =>
              _LanguageDialog(viewModel: viewModel),
          barrierDismissible: true,
          transitionBuilder: _buildAnimation,
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    );
  }

  Widget _buildAnimation(context, animationFirst, animationSecond, child) {
    var curve = Curves.easeInOut.transform(animationFirst.value);
    return Transform.scale(
      scale: curve,
      child: child,
    );
  }
}
