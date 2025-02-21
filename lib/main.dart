import 'package:flutter/material.dart';
import 'package:flutter_challenge/repositories/item_repository_http.dart';
import 'package:flutter_challenge/viewModels/item_provider.dart';
import 'package:flutter_challenge/viewModels/theme_provider.dart';
import 'package:flutter_challenge/views/home_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:flutter_challenge/theme/colors.dart' as t;

void main() async{
  await dotenv.load(fileName: "assets/.env");
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>ItemProvider(ItemRepositoryHttp())),
          ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider=Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: t.Color.black,
        secondaryHeaderColor: t.Color.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: t.Color.white,
        secondaryHeaderColor: t.Color.dgrey,
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: t.Color.dblue,
        ),
      ),
      themeMode: themeProvider.isDarkMode? ThemeMode.dark: ThemeMode.light,
      home: const HomeView(),
    );
  }
}
