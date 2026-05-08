import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme(this.textTheme);

  final TextTheme textTheme;
  static ColorScheme lightScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFFC16438),
      primary: const Color(0xFFC16438),
      surface: Colors.white,
    );
  }

  ThemeData light() => theme(lightScheme());

  // ---------------------------------------------------------------------------
  // ThemeData
  // ---------------------------------------------------------------------------

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    primaryColor: const Color(0xFFC16438),
    scaffoldBackgroundColor: const Color(0xFFF7EED3),
    appBarTheme: AppBarThemeData(
      backgroundColor: const Color(0xFFF7EED3),
      titleTextStyle: textTheme.headlineLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      titleSpacing: 0,
      actionsPadding: const .only(right: 16),
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    colorScheme: colorScheme,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    textTheme: textTheme.apply(
      displayColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
    ),
    canvasColor: colorScheme.surface,

    // ── TextField ───────────────────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: .circular(16)),
      iconColor: colorScheme.primary,
      prefixIconColor: colorScheme.primary,
      hintStyle: textTheme.bodyMedium,
      errorStyle: textTheme.bodySmall,
      filled: true,
      fillColor: colorScheme.primaryContainer,
    ),

    // ── Buttons (base) ──────────────────────────────────────────────────
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // ── ElevatedButton — solid fill ─────────────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: colorScheme.primary),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          .symmetric(horizontal: 16, vertical: 12),
        ),
        backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onPrimary,
        ),
        textStyle: WidgetStatePropertyAll(
          textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: const WidgetStatePropertyAll(0),
      ),
    ),

    // ── OutlinedButton — ghost style ────────────────────────────────────
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: colorScheme.outlineVariant),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onSurface,
        ),
        textStyle: WidgetStatePropertyAll(
          textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: const WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.onSurface.withValues(alpha: 0.06),
        ),
      ),
    ),

    // ── TextButton — minimal / link style ──────────────────────────────
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onSurface,
        ),
        textStyle: WidgetStatePropertyAll(
          textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.onSurface.withValues(alpha: 0.06),
        ),
      ),
    ),

    // ── ListTile ────────────────────────────────────────────────────────
    listTileTheme: ListTileThemeData(
      minTileHeight: 0,
      contentPadding: const .symmetric(horizontal: 16),
      iconColor: colorScheme.primary,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      subtitleTextStyle: textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurface,
      ),
      minVerticalPadding: 16,
    ),

    // ── Divider — hairline, Threads-style ───────────────────────────────
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      thickness: 0.5,
      space: 0,
    ),

    // ── BottomNavigationBar / NavigationBar ─────────────────────────────
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: Colors.transparent,
      // No pill indicator — Threads style
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(color: colorScheme.onSurfaceVariant),
      ),
      labelBehavior: .alwaysHide,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: .fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: colorScheme.outlineVariant,
      selectedItemColor: colorScheme.primary,
    ),

    // ── Icon ────────────────────────────────────────────────────────────
    iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
  );
}
