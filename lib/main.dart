import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_navigation.dart';
import 'constants/colors.dart';
import 'providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MOApp());
}

class MOApp extends StatelessWidget {
  const MOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'MO Marketplace',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              useMaterial3: false,
              brightness: Brightness.light,
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
                secondary: AppColors.accent,
                surface: AppColors.background,
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: AppColors.background,
              cardColor: AppColors.cardBackground,
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: AppColors.cardBackground,
                iconTheme: const IconThemeData(color: AppColors.textPrimary),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              textTheme: GoogleFonts.poppinsTextTheme(
                ThemeData.light().textTheme,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: false,
              brightness: Brightness.dark,
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
                secondary: AppColors.accent,
                surface: AppColors.backgroundDark,
                brightness: Brightness.dark,
              ),
              scaffoldBackgroundColor: AppColors.backgroundDark,
              cardColor: AppColors.cardBackgroundDark,
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: AppColors.cardBackgroundDark,
                iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: GoogleFonts.poppins(
                  color: AppColors.textPrimaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              textTheme: GoogleFonts.poppinsTextTheme(
                ThemeData.dark().textTheme,
              ),
            ),
            home: const MainNavigation(),
          );
        },
      ),
    );
  }
}
