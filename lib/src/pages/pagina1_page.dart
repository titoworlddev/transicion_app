import 'package:flutter/material.dart';
import 'package:transicion_app/src/widgets/transition_button.dart';

import '../helpers/navigation_helpers.dart';
import 'pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    List navigations = [
      () => Navigate.push.cupertino(context, pagina: const Pagina2Page()),
      () => Navigate.push.defaults(context, pagina: const Pagina2Page()),
      () => Navigate.push.fade(context, pagina: const Pagina2Page()),
      () => Navigate.push.material(context, pagina: const Pagina2Page()),
      () => Navigate.push.rotation(context, pagina: const Pagina2Page()),
      () => Navigate.push.scale(context, pagina: const Pagina2Page()),
      () => Navigate.push.slide(context, pagina: const Pagina2Page()),
      () => Navigate.push.custom(context, pagina: const Pagina2Page(),
              transitionsBuilder: (x, animation, animation2, child) {
            final parent =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(parent),
              child: child,
            );
          }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TransitionButton(
              onPressed: () =>
                  Navigate.push.defaults(context, pagina: const Pagina2Page()),
              text: 'Go to page 2',
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigate.push.cupertino(context, pagina: const Pagina2Page());
      //     Navigate.push.defaults(context, pagina: const Pagina2Page());
      //     // Navigate.push.fade(context, pagina: const Pagina2Page());
      //     // Navigate.push.material(context, pagina: const Pagina2Page());
      //     // Navigate.push.rotation(context, pagina: const Pagina2Page());
      //     // Navigate.push.scale(context, pagina: const Pagina2Page());
      //     // Navigate.push.slide(context, pagina: const Pagina2Page());

      //     // Navigate.push.custom(context, pagina: const Pagina2Page(),
      //     //     transitionsBuilder: (x, animation, animation2, child) {
      //     //   final parent =
      //     //       CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      //     //   return FadeTransition(
      //     //     opacity: Tween<double>(begin: 0, end: 1).animate(parent),
      //     //     child: child,
      //     //   );
      //     // });

      //     // Navigate.pushReplacement.scale(context, pagina: Pagina2Page());

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
