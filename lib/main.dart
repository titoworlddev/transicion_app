import 'package:flutter/material.dart';

// import 'src/helpers/navigation_helpers.dart';
import 'src/pages/pagina1_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Transiciones App',
        // theme: ThemeData.light().copyWith(
        //   pageTransitionsTheme: DefaultTransitions.cupertino()
        //   // pageTransitionsTheme: DefaultTransitions.fadeUpwards() // material
        //   // pageTransitionsTheme: DefaultTransitions.zoom()
        //   // pageTransitionsTheme: DefaultTransitions.openUp()
        // ),
        home: Pagina1Page());
  }
}
