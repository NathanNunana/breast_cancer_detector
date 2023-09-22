part of bc_utils;

class CustomTextTheme {
  late TextTheme textTheme;

  static CustomTextTheme customTextTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? dark(context)
        : light(context);
  }

  static CustomTextTheme light(BuildContext context) => CustomTextTheme()
    ..textTheme = TextTheme(
        bodyMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).dark,
          letterSpacing: .5,
        ),
        bodyLarge: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).dark,
          letterSpacing: .5,
        ),
        headlineLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).dark,
          letterSpacing: .5,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).bgColor2,
          letterSpacing: .5,
        ),
        labelLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).light,
          letterSpacing: -0.3,
        ),
        labelMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).light,
          letterSpacing: -0.3,
        ),
        labelSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).danger,
          letterSpacing: -0.3,
        ),
        headlineSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          color: AppTheme.appTheme(context).success,
        ));
  static CustomTextTheme dark(BuildContext context) => CustomTextTheme()
    ..textTheme = TextTheme(
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).dark,
        letterSpacing: -0.3,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).dark,
        letterSpacing: -0.3,
      ),
      labelSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: AppTheme.appTheme(context).dark,
        letterSpacing: -0.3,
      ),
    );
}
