part of '../setting_view.dart';

class _AppLogoWidget extends StatelessWidget {
  const _AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingSymmetricLowHorizontal,
      child: Card(
        color: context.theme.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: context.lowCircularRadius,
        ),
        child: Padding(
          padding: context.paddingLow,
          child: Center(
            child: Row(
              children: [
                context.spacer,
                context.dynamicExpanded(
                  1,
                  buildLogo(),
                ),
                context.dynamicExpanded(
                  3,
                  _buildText(context),
                ),
                context.spacer,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(BuildContext context) {
    return Text(
      ApplicationConstants.appTitle,
      style: context.textTheme.headline2?.copyWith(fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }

  ClipRRect buildLogo() {
    const double imageSize = 40;
    final BorderRadius borderRadius = BorderRadius.circular(10);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        ImageConstants.instance.pngPath.appLogo,
        fit: BoxFit.fill,
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}
