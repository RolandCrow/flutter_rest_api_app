import 'package:flutter/material.dart';
import 'package:flutter_rest_api_app/controller/framework_controller.dart';
import 'package:flutter_rest_api_app/screens/home.dart';


  void main() {
    return runApp(MyApp());
  }

  class MyApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _MyAppState();

  }

  class _MyAppState extends State<MyApp> {
      final FrameworkController controller = FrameworkController.to;

      @override
  void initState() {

    super.initState();
    controller.fetchAllFramework();
  }

        @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFFee5f00)),
        ),
          home: Home(),
    );
  }

  }

