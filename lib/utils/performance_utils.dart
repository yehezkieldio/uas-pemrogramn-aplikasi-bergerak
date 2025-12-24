import 'package:flutter/material.dart';

/// Performance utilities for the Klinik Sehat app.
///
/// Contains helpers for image caching, debouncing, and other
/// performance-related optimizations.
class PerformanceUtils {
  PerformanceUtils._();

  /// Default cache dimensions for list item images (in logical pixels).
  /// These values are optimized for typical mobile screen densities.
  static const int listItemCacheWidth = 200;
  static const int listItemCacheHeight = 200;

  /// Cache dimensions for avatar/profile images
  static const int avatarCacheWidth = 120;
  static const int avatarCacheHeight = 120;

  /// Cache dimensions for large hero images
  static const int heroCacheWidth = 400;
  static const int heroCacheHeight = 300;
}

/// A widget that wraps [Image.asset] with automatic caching optimization.
///
/// This widget sets [cacheWidth] and [cacheHeight] to decode images at the
/// display size rather than full resolution, saving significant RAM on Android.
///
/// Example usage:
/// ```dart
/// OptimizedAssetImage(
///   assetPath: 'assets/doctor_photo.png',
///   width: 80,
///   height: 100,
/// )
/// ```
class OptimizedAssetImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;

  /// The cache dimensions. If not specified, defaults to 2x the display size
  /// to account for high DPI screens.
  final int? cacheWidth;
  final int? cacheHeight;

  const OptimizedAssetImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.cacheWidth,
    this.cacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate cache dimensions based on display size and device pixel ratio
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final effectiveCacheWidth =
        cacheWidth ??
        (width != null ? (width! * devicePixelRatio).toInt() : null);
    final effectiveCacheHeight =
        cacheHeight ??
        (height != null ? (height! * devicePixelRatio).toInt() : null);

    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: effectiveCacheWidth,
      cacheHeight: effectiveCacheHeight,
      errorBuilder: (context, error, stackTrace) {
        return placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.broken_image_outlined,
                color: Colors.grey,
              ),
            );
      },
    );
  }
}

/// A widget that wraps [Image.network] with automatic caching optimization.
///
/// This widget sets [cacheWidth] and [cacheHeight] to decode images at the
/// display size rather than full resolution, saving significant RAM on Android.
class OptimizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  /// The cache dimensions. If not specified, defaults to 2x the display size
  /// to account for high DPI screens.
  final int? cacheWidth;
  final int? cacheHeight;

  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.cacheWidth,
    this.cacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate cache dimensions based on display size and device pixel ratio
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final effectiveCacheWidth =
        cacheWidth ??
        (width != null ? (width! * devicePixelRatio).toInt() : null);
    final effectiveCacheHeight =
        cacheHeight ??
        (height != null ? (height! * devicePixelRatio).toInt() : null);

    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: effectiveCacheWidth,
      cacheHeight: effectiveCacheHeight,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade100,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade200,
              child: const Icon(
                Icons.broken_image_outlined,
                color: Colors.grey,
              ),
            );
      },
    );
  }
}

/// Mixin that provides debounce functionality for search operations.
///
/// Usage:
/// ```dart
/// class _MyPageState extends State<MyPage> with DebouncedSearchMixin {
///   void _onSearchChanged(String query) {
///     debounceSearch(() {
///       setState(() {
///         _searchQuery = query;
///         _updateResults();
///       });
///     });
///   }
/// }
/// ```
mixin DebouncedSearchMixin<T extends StatefulWidget> on State<T> {
  /// Override to customize debounce duration (default: 300ms)
  Duration get debounceDuration => const Duration(milliseconds: 300);

  int _debounceVersion = 0;

  /// Debounces the given callback. Only the last call within the debounce
  /// duration will be executed.
  void debounceSearch(VoidCallback callback) {
    final currentVersion = ++_debounceVersion;
    Future.delayed(debounceDuration, () {
      if (mounted && currentVersion == _debounceVersion) {
        callback();
      }
    });
  }

  /// Cancels any pending debounced search
  void cancelDebouncedSearch() {
    _debounceVersion++;
  }
}
