part of '../setting_view.dart';

class _PrivacyDialog extends StatelessWidget {
  final SettingViewModel viewModel;
  const _PrivacyDialog({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPrivacyHeader(context),
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 20))
                  .then((value) {
                return rootBundle
                    .loadString('assets/privacy/privacy-policy.md');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data.toString(),
                    styleSheet: MarkdownStyleSheet(
                      h2: context.textTheme.headline2,
                      h3: context.textTheme.headline3,
                      p: context.textTheme.bodyText1,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const CloseButton()
        ],
      ),
    );
  }

  Column _buildPrivacyHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingTopNormal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPrivacyIcon(context),
              _buildPrivacyTitle(context),
            ],
          ),
        ),
      ],
    );
  }

  LocaleText _buildPrivacyTitle(BuildContext context) {
    return LocaleText(
      text: LocaleKeys.profilePage_privacyPolicy_title,
      style: context.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Padding _buildPrivacyIcon(BuildContext context) {
    return Padding(
      padding: context.paddingRightNormal,
      child: const Icon(Icons.privacy_tip),
    );
  }
}
