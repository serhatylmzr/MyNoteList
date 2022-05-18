part of '../setting_view.dart';

class _DrawerImageWidget extends StatelessWidget {
  const _DrawerImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _imageSize = 150;
    return Padding(
      padding: context.paddingSymmetricNormalHorizontal,
      child: Padding(
        padding: context.paddingTopHigh,
        child: SizedBox(
            width: _imageSize,
            height: _imageSize,
            child: _buildSvgPicture(
                ImageConstants.instance.svgPath.drawerNotebook)),
      ),
    );
  }
}

SvgPicture _buildSvgPicture(String path) => SvgPicture.asset(path);
