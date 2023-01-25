// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/http_certificate.dart';
import 'features/app/home/home_page.dart';
import 'features/app/routes/on_generate.dart';
import 'features/app/splash/splash_screen.dart';
import 'features/image_generator/presentation/cubit/image_generate_cubit.dart'
    show ImageGenerationCubit;
import 'features/tex_comparitor/presentaion/cubit/text_comple_cubit.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
        BlocProvider<ImageGenerationCubit>(
          create: (_) => di.sl<ImageGenerationCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
