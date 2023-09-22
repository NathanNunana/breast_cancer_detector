part of bc_utils;

class AppTheme {
  late final Color bgColor;
  late final Color primaryColor;
  late final Color uploadColor;
  late final Color light;
  late final Color dark;
  late final Color secondaryColor;
  late final Color danger;
  late final Color success;
  late final Color bgColor2;

  AppTheme({
    required this.bgColor,
    required this.primaryColor,
    required this.uploadColor,
    required this.light,
    required this.dark,
    required this.secondaryColor,
    required this.danger,
    required this.success,
    required this.bgColor2,
  });

  factory AppTheme.light() {
    return AppTheme(
      bgColor: const Color(0xffe8ebeb),
      primaryColor: const Color(0xfff12895),
      uploadColor: const Color(0xfffca34d),
      light: const Color(0xffffffff),
      dark: const Color(0xff0c0e16),
      secondaryColor: const Color(0xff118e06),
      danger: const Color(0xffff0000),
      success: const Color(0xff192bdf),
      bgColor2: const Color(0xffD9D9D9),
    );
  }

  factory AppTheme.dark() {
    return AppTheme(
      bgColor: const Color(0xffe8ebeb),
      primaryColor: const Color(0xfff12895),
      uploadColor: const Color(0xfffca34d),
      light: const Color(0xffffffff),
      dark: const Color(0xff0c0e16),
      secondaryColor: const Color(0xff118e06),
      danger: const Color(0xffff0000),
      success: const Color(0xff192bdf),
      bgColor2: const Color(0xffD9D9D9),
    );
  }

  static AppTheme appTheme(BuildContext context) {
    final brightness = CupertinoTheme.of(context).brightness;
    return brightness == Brightness.dark ? AppTheme.dark() : AppTheme.light();
  }
}
