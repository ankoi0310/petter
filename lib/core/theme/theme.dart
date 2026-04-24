import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme(this.textTheme);

  final TextTheme textTheme;

  // ---------------------------------------------------------------------------
  // Threads-inspired palette — pure monochromatic, zero color tinting
  // ---------------------------------------------------------------------------
  //
  // Light:  surface #FFFFFF · primary #101010 · muted grays for hierarchy
  // Dark:   surface #000000 · primary #F5F5F5 · true-black Threads signature
  // Accent: none — Threads uses NO accent color; contrast does the work.
  // ---------------------------------------------------------------------------

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,

      // Brand / interactive
      primary: Color(0xff101010),
      // Near-black — buttons, active icons
      onPrimary: Color(0xffffffff),
      // White text on primary
      primaryContainer: Color(0xfff3f3f3),
      // Light chip / tag background
      onPrimaryContainer: Color(0xff6b6b6b),
      // Muted label inside chip
      // Secondary (sheets, bottom bars)
      secondary: Color(0xfff3f3f3),
      onSecondary: Color(0xff101010),

      // Tertiary (cards, subtle surfaces)
      tertiary: Color(0xffebebeb),
      onTertiary: Color(0xff101010),

      // Surfaces
      surface: Color(0xffffffff),
      // Pure white canvas
      onSurface: Color(0xff101010),
      // Primary text
      onSurfaceVariant: Color(0xff4a4a4a),
      // Secondary text / captions
      // Outlines / dividers — hairline, barely-there
      outline: Color(0xffe0e0e0),
      outlineVariant: Color(0xffc7c7c7),

      // Status
      error: Color(0xffe7000b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),

      // Misc
      surfaceTint: Colors.transparent,
      // No tint — Threads is tint-free
      shadow: Color(0xff000000),
    );
  }

  ThemeData light() => theme(lightScheme());

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,

      // Brand / interactive
      primary: Color(0xfff5f5f5),
      // Off-white — the Threads dark CTA
      onPrimary: Color(0xff101010),
      // Near-black text on primary
      primaryContainer: Color(0xff1a1a1a),
      // Raised chip background
      onPrimaryContainer: Color(0xff999999),
      // Muted label inside chip
      // Secondary
      secondary: Color(0xff1a1a1a),
      onSecondary: Color(0xfff5f5f5),

      // Tertiary
      tertiary: Color(0xff222222),
      onTertiary: Color(0xfff5f5f5),

      // Surfaces — true black, no grey-tint
      surface: Color(0xff000000),
      // True black canvas
      onSurface: Color(0xfff5f5f5),
      // Primary text
      onSurfaceVariant: Color(0xff9b9b9b),
      // Secondary text / captions
      // Outlines — very subtle on black
      outline: Color(0x1fffffff),
      // ~12 % white
      outlineVariant: Color(0x33ffffff),
      // ~20 % white
      // Status
      error: Color(0xffff6467),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),

      // Misc
      surfaceTint: Colors.transparent,
      shadow: Color(0xff000000),
    );
  }

  ThemeData dark() => theme(darkScheme());

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  OutlineInputBorder _border({
    required Color color,
    double? borderWidth,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: borderWidth ?? 1),
      borderRadius: BorderRadius.circular(12),
    );
  }

  // ---------------------------------------------------------------------------
  // ThemeData
  // ---------------------------------------------------------------------------

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,

    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),

    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,

    // ── AppBar ──────────────────────────────────────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.headlineLarge?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      actionsPadding: const .only(right: 16),
    ),

    // ── TextField ───────────────────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      border: _border(color: colorScheme.outlineVariant),
      enabledBorder: _border(color: colorScheme.outlineVariant),
      focusedBorder: _border(
        color: colorScheme.primary,
        borderWidth: 2,
      ),
      errorBorder: _border(color: colorScheme.onErrorContainer),
      focusedErrorBorder: _border(
        color: colorScheme.onErrorContainer,
        borderWidth: 2,
      ),
      iconColor: colorScheme.primary,
      prefixIconColor: colorScheme.primary,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.outlineVariant,
      ),
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
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(color: colorScheme.primary),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
          .symmetric(horizontal: 12, vertical: 8),
        ),
        backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onPrimary,
        ),
        textStyle: WidgetStatePropertyAll(
          textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        // Threads uses no elevation — flat buttons only
        elevation: const WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(
          colorScheme.onPrimary.withValues(alpha: 0.08),
        ),
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
      contentPadding: EdgeInsets.zero,
      iconColor: colorScheme.primary,
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
