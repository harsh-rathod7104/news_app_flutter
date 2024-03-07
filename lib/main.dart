import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/bloc/home_bloc.dart';
import 'package:news_app/features/home/bloc/home_event.dart';
import 'package:news_app/features/home/bloc/screen_cubit/screen_cubit.dart';
import 'package:news_app/features/home/data/home_repository.dart';
import 'package:news_app/features/home/screens/main_screen.dart';
import 'package:news_app/features/home/screens/news_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white, // status bar color
  ));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                color: Colors.white,
                elevation: 0,
              ),
            ),
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (_) => HomeBloc(newsRepository: HomeRespository())
                      ..add(FetchNewsEvent())),
                BlocProvider(
                  create: (_) => ScreenCubit(),
                ),
              ],
              child: const MainScreen(),
            ));
      },
    );
  }
}
