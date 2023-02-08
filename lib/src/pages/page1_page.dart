import 'package:flutter/material.dart';
import 'package:transicion_app/src/pages/page2_page.dart';
import 'package:transicion_app/src/widgets/transition_button.dart';

import '../helpers/navigation_helpers.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Function> navigations = {
      'Cupertino': () =>
          Navigate.push.cupertino(context, pagina: const Page2Page()),
      'System': () =>
          Navigate.push.defaults(context, pagina: const Page2Page()),
      'Fade': () => Navigate.push.fade(context, pagina: const Page2Page()),
      'Material': () =>
          Navigate.push.material(context, pagina: const Page2Page()),
      'Rotation': () =>
          Navigate.push.rotation(context, pagina: const Page2Page()),
      'Scale': () => Navigate.push.scale(context, pagina: const Page2Page()),
      'Slide': () => Navigate.push.slide(context, pagina: const Page2Page()),
      'Custom': () => Navigate.push.custom(
            context,
            pagina: const Page2Page(),
            transitionsBuilder: (x, animation, animation2, child) {
              final parent =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(parent),
                child: child,
              );
            },
          ),
    };

    Map<String, Function> navigationsWithReplacement = {
      'Cupertino': () => Navigate.pushReplacement
          .cupertino(context, pagina: const Page2Page()),
      'System': () =>
          Navigate.pushReplacement.defaults(context, pagina: const Page2Page()),
      'Fade': () =>
          Navigate.pushReplacement.fade(context, pagina: const Page2Page()),
      'Material': () =>
          Navigate.pushReplacement.material(context, pagina: const Page2Page()),
      'Rotation': () =>
          Navigate.pushReplacement.rotation(context, pagina: const Page2Page()),
      'Scale': () =>
          Navigate.pushReplacement.scale(context, pagina: const Page2Page()),
      'Slide': () =>
          Navigate.pushReplacement.slide(context, pagina: const Page2Page()),
      'Custom': () => Navigate.pushReplacement.custom(
            context,
            pagina: const Page2Page(),
            transitionsBuilder: (x, animation, animation2, child) {
              final parent =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(parent),
                child: child,
              );
            },
          ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ...navigations.entries.map(
              (e) => TransitionButton(
                text: '${e.key} Transition',
                onPressed: () => e.value(),
              ),
            ),
            ...navigationsWithReplacement.entries.map(
              (e) => TransitionButton(
                color: Colors.green,
                text: '${e.key} Transition With Replacement',
                onPressed: () => e.value(),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Lo que se uso en el curso
      //     // Navigator.push(context, MaterialPageRoute(builder: (x) => Pagina2Page()));
      //     // Navigator.push(context, crearRuta(pagina: Pagina2Page()));
      //   },
      //   child: const Icon(Icons.keyboard_arrow_right),
      // ),
    );
  }

  // Todo el metodo siguiente es el metodo que implemento Fernando Herrera en el curso,
  // lo dejo porque es interesante siempre ver como lo hizo pero la clase que he creado en los helpers
  // mejora esto y ademas tiene las mismas transiciones que hay aqui, pero solo hay que llamarla y poner la pagina.
  // Aunque no es exactamente el que el hizo porque yo le he añadido la opcion de escoger cupertino y material.
  Route crearRuta({required Widget pagina}) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          pagina,
      // transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final parent =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        // return SlideTransition(
        //   child: child,
        //   position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero).animate(parent),
        // );

        // return ScaleTransition(
        //   child: child,
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(parent),
        // );

        // return RotationTransition(
        //   child: child,
        //   turns: Tween<double>(begin: 0.5, end: 1.0).animate(parent),
        // );

        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(parent),
          child: child,
        );

        // return RotationTransition(
        //   child: FadeTransition(
        //     child: child,
        //     opacity: Tween<double>(begin: 0.0, end: 1.0).animate(parent)
        //   ),
        //   turns: Tween<double>(begin: 0.5, end: 1.0).animate(parent),
        // );
      },
    );
  }
}
