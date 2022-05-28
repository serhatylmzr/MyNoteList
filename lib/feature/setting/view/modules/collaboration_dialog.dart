part of '../setting_view.dart';

class _CollaborationDialog extends StatelessWidget {
  final SettingViewModel viewModel;
  const _CollaborationDialog({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _email = 'serhatylmzr@gmail.com';
    const String _github = 'www.github.com/serhatylmzr';
    const String _linkedin = 'www.linkedin.com/in/serhat-yilmazer/';
    return SizedBox(
      height: context.dynamicHeight(0.3),
      width: context.dynamicWidth(0.4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCollaborationHeader(context),
          Expanded(
            child: Padding(
              padding: context.paddingSymmetricLowHorizontal,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildListTile(context, Icons.mail_outline, _email),
                  _buildListTile(
                      context, Icons.arrow_right_alt_outlined, _linkedin),
                  _buildListTile(
                      context, Icons.arrow_right_alt_outlined, _github),
                ],
              ),
            ),
          ),
          const CloseButton(),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String text) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: context.textTheme.bodyText1),
    );
  }

  Column _buildCollaborationHeader(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingTopNormal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildCollaborationIcon(context),
              _buildCollaborationTitle(context),
            ],
          ),
        ),
      ],
    );
  }

  LocaleText _buildCollaborationTitle(BuildContext context) {
    return LocaleText(
      text: LocaleKeys.profilePage_collaboration_title,
      style: context.textTheme.headline3?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Padding _buildCollaborationIcon(BuildContext context) {
    return Padding(
      padding: context.paddingRightNormal,
      child: const Icon(Icons.handshake_rounded),
    );
  }
}
