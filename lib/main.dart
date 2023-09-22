import 'package:breast_cancer/model/_index.dart';
import 'package:breast_cancer/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ResultAdapterAdapter());
  Hive.openBox<ResultAdapter>('results');
  runApp(
    const ProviderScope(child: BreastCancer()),
  );
}

class BreastCancer extends ConsumerWidget {
  const BreastCancer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Breast Cancer',
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        primaryColor: AppTheme.appTheme(context).primaryColor,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
        scaffoldBackgroundColor: AppTheme.appTheme(context).bgColor,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.wrapperRoute,
    );
  }
}
