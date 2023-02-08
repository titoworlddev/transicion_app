import 'package:flutter/material.dart';

// import 'src/helpers/navigation_helpers.dart';
import 'src/pages/page1_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transitions App',
      // theme: ThemeData.light().copyWith(
      //   pageTransitionsTheme: DefaultTransitions.cupertino()
      //   // pageTransitionsTheme: DefaultTransitions.fadeUpwards() // material
      //   // pageTransitionsTheme: DefaultTransitions.zoom()
      //   // pageTransitionsTheme: DefaultTransitions.openUp()
      // ),
      home: Page1Page(),
    );
  }
}
