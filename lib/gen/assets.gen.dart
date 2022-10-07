/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Home.svg
  SvgGenImage get home => const SvgGenImage('assets/images/Home.svg');

  /// File path: assets/images/Profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/images/Profile.svg');

  /// File path: assets/images/Rectangle.svg
  SvgGenImage get rectangle => const SvgGenImage('assets/images/Rectangle.svg');

  /// File path: assets/images/Search.svg
  SvgGenImage get search => const SvgGenImage('assets/images/Search.svg');

  /// File path: assets/images/Send.svg
  SvgGenImage get send => const SvgGenImage('assets/images/Send.svg');

  /// File path: assets/images/Star.svg
  SvgGenImage get star => const SvgGenImage('assets/images/Star.svg');

  /// File path: assets/images/Voice.svg
  SvgGenImage get voice => const SvgGenImage('assets/images/Voice.svg');

  /// File path: assets/images/Wallet.svg
  SvgGenImage get wallet => const SvgGenImage('assets/images/Wallet.svg');

  /// File path: assets/images/expert 1.png
  AssetGenImage get expert1 =>
      const AssetGenImage('assets/images/expert 1.png');

  /// File path: assets/images/expert 2.png
  AssetGenImage get expert2 =>
      const AssetGenImage('assets/images/expert 2.png');

  /// File path: assets/images/hr.svg
  SvgGenImage get hr => const SvgGenImage('assets/images/hr.svg');

  /// File path: assets/images/immigration.svg
  SvgGenImage get immigration =>
      const SvgGenImage('assets/images/immigration.svg');

  /// File path: assets/images/it.svg
  SvgGenImage get it => const SvgGenImage('assets/images/it.svg');

  /// File path: assets/images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.png');

  /// File path: assets/images/read_message.svg
  SvgGenImage get readMessage =>
      const SvgGenImage('assets/images/read_message.svg');

  /// File path: assets/images/robot.svg
  SvgGenImage get robot => const SvgGenImage('assets/images/robot.svg');

  /// File path: assets/images/robot_alert.svg
  SvgGenImage get robotAlert =>
      const SvgGenImage('assets/images/robot_alert.svg');

  /// File path: assets/images/robot_message.svg
  SvgGenImage get robotMessage =>
      const SvgGenImage('assets/images/robot_message.svg');

  /// File path: assets/images/security.svg
  SvgGenImage get security => const SvgGenImage('assets/images/security.svg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/supply chain.svg
  SvgGenImage get supplyChain =>
      const SvgGenImage('assets/images/supply chain.svg');

  /// File path: assets/images/translation.svg
  SvgGenImage get translation =>
      const SvgGenImage('assets/images/translation.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
