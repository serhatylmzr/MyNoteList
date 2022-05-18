part of '../setting_view.dart';

class _AppLogoWidget extends StatelessWidget {
  const _AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 40;
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      ImageConstants.instance.pngPath.appLogo,
                      fit: BoxFit.fill,
                      width: imageSize,
                      height: imageSize,
                    ),
                  ),
                ),
                context.dynamicExpanded(
                  3,
                  Text(
                    ApplicationConstants.appTitle,
                    style: context.textTheme.headline2
                        ?.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                context.spacer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
