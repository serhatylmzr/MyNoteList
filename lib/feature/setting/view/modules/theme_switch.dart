part of '../setting_view.dart';

class _ThemeSwitch extends StatelessWidget {
  final SettingViewModel viewModel;
  const _ThemeSwitch({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double switchScale = 0.7;
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Transform.scale(
            scale: switchScale,
            child: CupertinoSwitch(
              activeColor: context.theme.canvasColor,
              trackColor: context.theme.canvasColor,
              value: state.darkMode,
              onChanged: (value) {
                context.read<SettingCubit>().changeTheme(value);
              },
            ));
      },
    );
  }
}
