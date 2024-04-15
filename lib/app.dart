import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teach_me/config/routes/app_route.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/theme/light_theme.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';
import 'injection_container.dart' as di;

class TeachMeApp extends StatefulWidget {
  const TeachMeApp({super.key});

  @override
  State<TeachMeApp> createState() => _TeachMeAppState();
}

class _TeachMeAppState extends State<TeachMeApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.sl<LocaleCubit>()..getSavedLang(),
          ),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (_, localeState) {
              return DevicePreview(
                  enabled: !kReleaseMode, //!kReleaseMode,
                  builder: (context) => MaterialApp(
                        debugShowCheckedModeBanner: false,
                        useInheritedMediaQuery: true,
                        onGenerateRoute: AppRoutes.onGenerateRoute,
                        theme: AppTheme.appLightTheme(context),
                        supportedLocales:
                            AppLocalizationsSetup.supportedLocales,
                        localizationsDelegates:
                            AppLocalizationsSetup.localizationsDelegates,
                        localeResolutionCallback:
                            AppLocalizationsSetup.localeResolutionCallback,
                        locale: localeState.locale,
                      ));
            }));
  }
}
