// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../image_generator/presentation/pages/image_generator_page.dart';
import '../../tex_comparitor/presentaion/pages/text_comp_page.dart';
import '../app_const/page_const.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        {
          return materialBuilder(
            widget: const ErrorPage(),
          );
        }
      case PageConst.ImageGenerationPage:
        {
          return materialBuilder(
            widget: ImageGenerationPage(),
          );
        }
      case PageConst.textCompletionPage:
        {
          return materialBuilder(
            widget: TextCompletionPage(),
          );
        }
      default:
        return materialBuilder(
          widget: const ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
