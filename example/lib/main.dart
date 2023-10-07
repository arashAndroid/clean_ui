import 'package:example/widgets/main/core/MainViewModel.dart';
import 'package:example/widgets/main/view/MainView.dart';
import 'package:flutter/material.dart';
import 'package:clean_ui/clean_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lenore Demo',
      initialRoute: '/',
      theme: ThemeData(
        shadowColor: Colors.black.withOpacity(0.25),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.lightBlue,
          onPrimary: Colors.white,
          secondary: Colors.lightGreen,
          onSecondary: Colors.white,
          error: Colors.deepOrange,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.grey.shade800,
          surface: Colors.white,
          onSurface: Colors.grey.shade800,
          shadow: Colors.black.withOpacity(0.25),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/MainView':
            return MaterialPageRoute(builder: (context) => const MainView());
          case '/':
            return MaterialPageRoute(builder: (context) => const MainView());
          default:
            return MaterialPageRoute(builder: (context) => const MainView());
        }
      },
    );
  }
}
