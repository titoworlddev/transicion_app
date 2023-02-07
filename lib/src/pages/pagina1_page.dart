import 'package:flutter/material.dart';

import '../helpers/navigation_helpers.dart';
import 'pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate.push.flip(context, paginaAnterior: Pagina1Page(), paginaSiguiente: Pagina2Page(), );
          // Navigate.pushReplacement.flip(context, paginaAnterior: Pagina1Page(), paginaSiguiente: Pagina2Page(), );
          Navigate.push.defaults(context, pagina: Pagina2Page());
          // Navigate.pushReplacement.defaults(context, pagina: Pagina2Page());
          // Navigate.push.material(context, pagina: Pagina2Page());
          // Navigate.push.cupertino(context, pagina: Pagina2Page());
          // Navigate.pushReplacement.slide(context, pagina: Pagina2Page());
          // Navigate.pushReplacement.fade(context, pagina: Pagina2Page());
          // Navigate.pushReplacement.rotation(context, pagina: Pagina2Page());
          // Navigate.pushReplacement.scale(context, pagina: Pagina2Page());
          // Navigate.push.custom(context, pagina: Pagina2Page(), transitionsBuilder: (x, animation, animation2, child) {
          //   final parent = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          //   return FadeTransition(
          //     child: child,
          //     opacity: Tween<double>(begin: 0, end: 1).animate(parent),
          //   );
          // });

          // Lo que se uso en el curso
          // Navigator.push(context, MaterialPageRoute(builder: (x) => Pagina2Page()));
          // Navigator.push(context, crearRuta(pagina: Pagina2Page()));
        },
        child: Icon(Icons.keyboard_arrow_right),
      ),
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
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(parent));

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
