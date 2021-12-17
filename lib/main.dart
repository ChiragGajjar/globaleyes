import 'package:flutter/material.dart';
import 'package:globaleyes/common_imports.dart';
import 'package:globaleyes/screens/splash.dart';
import 'package:globaleyes/values/app_colors.dart';
import 'package:globaleyes/values/app_string.dart';
import 'package:provider/provider.dart';
import 'base/deep_linking_helper_pamperclub.dart';
import 'core/data/preference/preference.dart';
import 'core/routes/app_route.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.load();

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    DeepLinkBloc2 _bloc = DeepLinkBloc2();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        color: AppColors.black,
        initialRoute: "/",
        onGenerateRoute: AppRoute.routes,
        home: Scaffold(
          body: Provider<DeepLinkBloc2>(
              create: (context) => _bloc,
              dispose: (context, bloc) => bloc.dispose(),
              child: const SplashScreen()),
        ),
      ),
    );
  }
}
