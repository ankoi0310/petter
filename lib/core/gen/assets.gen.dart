// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/female.svg
  SvgGenImage get female => const SvgGenImage('assets/icons/female.svg');

  /// File path: assets/icons/male.svg
  SvgGenImage get male => const SvgGenImage('assets/icons/male.svg');

  /// File path: assets/icons/map_pin.svg
  SvgGenImage get mapPin => const SvgGenImage('assets/icons/map_pin.svg');

  /// List of all assets
  List<SvgGenImage> get values => [female, male, mapPin];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.jpg
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.jpg');

  /// Directory path: assets/images/categories
  $AssetsImagesCategoriesGen get categories =>
      const $AssetsImagesCategoriesGen();

  /// File path: assets/images/empty_message.svg
  SvgGenImage get emptyMessage =>
      const SvgGenImage('assets/images/empty_message.svg');

  /// File path: assets/images/empty_notification.svg
  SvgGenImage get emptyNotification =>
      const SvgGenImage('assets/images/empty_notification.svg');

  /// Directory path: assets/images/pets
  $AssetsImagesPetsGen get pets => const $AssetsImagesPetsGen();

  /// File path: assets/images/welcome_1.svg
  SvgGenImage get welcome1 => const SvgGenImage('assets/images/welcome_1.svg');

  /// File path: assets/images/welcome_2.svg
  SvgGenImage get welcome2 => const SvgGenImage('assets/images/welcome_2.svg');

  /// File path: assets/images/welcome_3.svg
  SvgGenImage get welcome3 => const SvgGenImage('assets/images/welcome_3.svg');

  /// List of all assets
  List<dynamic> get values => [
    banner,
    emptyMessage,
    emptyNotification,
    welcome1,
    welcome2,
    welcome3,
  ];
}

class $AssetsImagesCategoriesGen {
  const $AssetsImagesCategoriesGen();

  /// File path: assets/images/categories/bird.jpg
  AssetGenImage get bird =>
      const AssetGenImage('assets/images/categories/bird.jpg');

  /// File path: assets/images/categories/cat.jpg
  AssetGenImage get cat =>
      const AssetGenImage('assets/images/categories/cat.jpg');

  /// File path: assets/images/categories/dog.jpg
  AssetGenImage get dog =>
      const AssetGenImage('assets/images/categories/dog.jpg');

  /// File path: assets/images/categories/rabbit.jpg
  AssetGenImage get rabbit =>
      const AssetGenImage('assets/images/categories/rabbit.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [bird, cat, dog, rabbit];
}

class $AssetsImagesPetsGen {
  const $AssetsImagesPetsGen();

  /// File path: assets/images/pets/pet_0.jpg
  AssetGenImage get pet0 => const AssetGenImage('assets/images/pets/pet_0.jpg');

  /// File path: assets/images/pets/pet_1.jpg
  AssetGenImage get pet1 => const AssetGenImage('assets/images/pets/pet_1.jpg');

  /// File path: assets/images/pets/pet_10.jpg
  AssetGenImage get pet10 =>
      const AssetGenImage('assets/images/pets/pet_10.jpg');

  /// File path: assets/images/pets/pet_11.jpg
  AssetGenImage get pet11 =>
      const AssetGenImage('assets/images/pets/pet_11.jpg');

  /// File path: assets/images/pets/pet_2.jpg
  AssetGenImage get pet2 => const AssetGenImage('assets/images/pets/pet_2.jpg');

  /// File path: assets/images/pets/pet_3.jpg
  AssetGenImage get pet3 => const AssetGenImage('assets/images/pets/pet_3.jpg');

  /// File path: assets/images/pets/pet_4.jpg
  AssetGenImage get pet4 => const AssetGenImage('assets/images/pets/pet_4.jpg');

  /// File path: assets/images/pets/pet_5.jpg
  AssetGenImage get pet5 => const AssetGenImage('assets/images/pets/pet_5.jpg');

  /// File path: assets/images/pets/pet_6.jpg
  AssetGenImage get pet6 => const AssetGenImage('assets/images/pets/pet_6.jpg');

  /// File path: assets/images/pets/pet_7.jpg
  AssetGenImage get pet7 => const AssetGenImage('assets/images/pets/pet_7.jpg');

  /// File path: assets/images/pets/pet_8.jpg
  AssetGenImage get pet8 => const AssetGenImage('assets/images/pets/pet_8.jpg');

  /// File path: assets/images/pets/pet_9.jpg
  AssetGenImage get pet9 => const AssetGenImage('assets/images/pets/pet_9.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    pet0,
    pet1,
    pet10,
    pet11,
    pet2,
    pet3,
    pet4,
    pet5,
    pet6,
    pet7,
    pet8,
    pet9,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
