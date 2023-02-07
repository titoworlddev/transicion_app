import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flip_card/flip_card.dart';

/// Se puede usar para establecer la transicion por defecto para toda la app
class DefaultTransitions {
  /// Esta es la transicion por defecto de [iOS]
  /// que hace una transicion deslizandose de derecha a izquierda
  static PageTransitionsTheme cupertino() {
    return const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),

      // Todas las posibles transiciones
      // TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // esta es la de android por defecto
      // TargetPlatform.android: CupertinoPageTransitionsBuilder(), // esta es la de ios por defecto
      // TargetPlatform.android: ZoomPageTransitionsBuilder(),
      // TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),

      // Los siguientes solo si se va a hacer la app para esos sistemas
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
    });
  }

  /// Esta es la transicion por defecto de [Android]
  /// que hace una transicion subiendo y con un fade
  static PageTransitionsTheme fadeUpwards() {
    return const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.fuchsia: FadeUpwardsPageTransitionsBuilder(),
    });
  }

  /// Esta es la transicion por defecto de [Zoom]
  /// que hace una transicion unicamente con zoom en aumento
  static PageTransitionsTheme zoom() {
    return const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),

      // Todas las posibles transiciones
      // TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // esta es la de android por defecto
      // TargetPlatform.android: CupertinoPageTransitionsBuilder(), // esta es la de ios por defecto
      // TargetPlatform.android: ZoomPageTransitionsBuilder(),
      // TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),

      // Los siguientes solo si se va a hacer la app para esos sistemas
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
      TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.linux: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    });
  }

  /// Esta es la transicion por defecto de [OpenUp]
  /// que hace una transicion unicamente subiendo sin fade ni nada mas
  static PageTransitionsTheme openUp() {
    return const PageTransitionsTheme(builders: {
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),

      // Todas las posibles transiciones
      // TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // esta es la de android por defecto
      // TargetPlatform.android: CupertinoPageTransitionsBuilder(), // esta es la de ios por defecto
      // TargetPlatform.android: ZoomPageTransitionsBuilder(),
      // TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),

      // Los siguientes solo si se va a hacer la app para esos sistemas
      TargetPlatform.windows: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.fuchsia: OpenUpwardsPageTransitionsBuilder(),
    });
  }
}

/// * Esta clase te ayuda con la navegacion, utilizando unicamente [Navigator.push(context, route)]
/// o [Navigator.pushReplacement(context, route)] y eligiendo el tipo de transicion que se quiere usar,
/// de esta forma solo tienes que poner la pagina a la que navegar y automaticamente lo hace todo por ti,
/// pero tambien te da la opcion de personalizar un poco todas excepto [cupertino] y [material]
/// ya que son las navegaciones por defecto del sistema de IOS y Android
class Navigate {
  static late Widget paginaAnterior;

  /// Simple navegacion que te permite volver a la pantalla anterior
  static NavigationPush push = NavigationPush();
  // static _NavigationPush push() {
  //   return _NavigationPush();
  // }

  /// Navega a la ruta pero no te permite volver a la pantalla anterior
  static NavigationPushReplacement pushReplacement =
      NavigationPushReplacement();
  // static _NavigationPushReplacement pushNamed() {
  //   return _NavigationPushReplacement();
  // }
  // static GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
}

/* ========================================  
          Clase para el push
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
class NavigationPush {
  /// * La transicion por defecto de CupertinoDesign
  Future cupertino(BuildContext context, {required Widget pagina}) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => pagina));
  }

  /// * La transicion por defecto de MaterialDesign
  Future material(BuildContext context, {required Widget pagina}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => pagina));
  }

  /// La transicion que usa por defecto el sistema, es decir,
  /// si es android es la misma transicion que [material],
  /// pero si es iOS es la misma que [cupertino]
  Future defaults(BuildContext context, {required Widget pagina}) {
    final platform = Theme.of(context).platform;
    return (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS)
        ? Navigator.push(
            context, CupertinoPageRoute(builder: (context) => pagina))
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => pagina));
  }

  // Custom
  /// * Puedes crear tu propia transicion de pantalla
  /// * Con el [transitionBuilder] la especificas e incluso puedes anidarlas para que haga varias a la vez
  Future custom(BuildContext context,
      {required Widget pagina,
      Duration duration = const Duration(milliseconds: 300),
      required Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionsBuilder}) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: transitionsBuilder);
    return Navigator.push(context, transicion);
  }

  // Slide
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica desde donde quieres que empieze a moverse [Offset(0, 0)] es el medio
  /// * [end] indica la posicion final por defecto y lo normal es [Offset.zero]
  Future slide(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(seconds: 1),
    Offset begin = const Offset(1.0, 1.0),
    Offset end = Offset.zero,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return SlideTransition(
            position: Tween<Offset>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.push(context, transicion);
  }

  // // Flip
  // /// * [duration] indica la duracion total de la animacion
  // /// * [begin] indica desde donde quieres que empieze a moverse [Offset(0, 0)] es el medio
  // /// * [end] indica la posicion final por defecto y lo normal es [Offset.zero]
  // Future flip(BuildContext context, {
  //   required Widget paginaAnterior,
  //   required Widget paginaSiguiente,
  //   Duration duration = const Duration( milliseconds: 50),
  //   double begin = 0.0,
  //   double end = 1.0,
  // }) {
  //   GlobalKey<FlipCardState> cardKey = Navigate.cardKey;
  //   final transicion = PageRouteBuilder(
  //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
  //       => paginaSiguiente,
  //     transitionDuration: Duration(milliseconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       final parent = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  //       return FadeTransition(
  //         opacity: Tween<double>(begin: begin, end: end).animate(parent),
  //         child: FlipCard(
  //           flipOnTouch: false,
  //           key: cardKey,
  //           front: paginaAnterior,
  //           back: paginaSiguiente,
  //         ),
  //       );

  //     }
  //   );
  //   return Future.delayed(Duration(milliseconds: 0), () {
  //     Navigator.push(context, transicion);
  //     Future.delayed(duration, () {
  //       cardKey.currentState!.toggleCard();
  //     });
  //   });
  // }

  // Scale
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica la escala principal donde 0.0 es tan pequeño que no se ve y 1.0 es la escala normal
  /// * [end] indica la escala final
  Future scale(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(milliseconds: 300),
    double begin = 0.0,
    double end = 1.0,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return ScaleTransition(
            scale: Tween<double>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.push(context, transicion);
  }

  // Rotation
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica desde donde quieres que empieze a rotar (de 0.0 a 1.0 se da una vuelta completa,
  /// si quieres darlas al contrario de 0.0 a -1.0 es una vuelta completa)
  /// * [end] indica la posicion final
  Future rotation(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(milliseconds: 300),
    double begin = 0.5,
    double end = 1.0,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return RotationTransition(
            turns: Tween<double>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.push(context, transicion);
  }

  // Fade
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica la opacidad principal donde 0 es transparente y 1 totalmente opaco
  /// * [end] indica la opacidad final
  Future fade(BuildContext context,
      {required Widget pagina,
      Duration duration = const Duration(milliseconds: 300),
      double begin = 0.0,
      double end = 1.0}) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return FadeTransition(
              opacity: Tween<double>(begin: begin, end: end).animate(parent),
              child: child);
        });
    return Navigator.push(context, transicion);
  }
}

/* ========================================  
      Clase para el pushRepalcement
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ */
class NavigationPushReplacement {
  /// * La transicion por defecto de CupertinoDesign
  Future cupertino(BuildContext context, {required Widget pagina}) {
    return Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => pagina));
  }

  /// * La transicion por defecto de MaterialDesign
  Future material(BuildContext context, {required Widget pagina}) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => pagina));
  }

  /// La transicion que usa por defecto el sistema, es decir,
  /// si es android es la misma transicion que [material],
  /// pero si es iOS es la misma que [cupertino]
  Future defaults(BuildContext context, {required Widget pagina}) {
    final platform = Theme.of(context).platform;
    return (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS)
        ? Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => pagina))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => pagina));
  }

  // Custom
  /// * Puedes crear tu propia transicion de pantalla
  /// * Con el [transitionBuilder] la especificas e incluso puedes anidarlas para que haga varias a la vez
  Future custom(BuildContext context,
      {required Widget pagina,
      Duration duration = const Duration(milliseconds: 300),
      required Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionsBuilder}) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: transitionsBuilder);
    return Navigator.pushReplacement(context, transicion);
  }

  // Slide
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica desde donde quieres que empieze a moverse [Offset(0, 0)] es el medio
  /// * [end] indica la posicion final por defecto y lo normal es [Offset.zero]
  Future slide(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(milliseconds: 300),
    Offset begin = const Offset(1.0, 1.0),
    Offset end = Offset.zero,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return SlideTransition(
            position: Tween<Offset>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.pushReplacement(context, transicion);
  }

  // // Flip
  // /// * [duration] indica la duracion total de la animacion
  // /// * [begin] indica desde donde quieres que empieze a moverse [Offset(0, 0)] es el medio
  // /// * [end] indica la posicion final por defecto y lo normal es [Offset.zero]
  // Future flip(BuildContext context, {
  //   required Widget paginaAnterior,
  //   required Widget paginaSiguiente,
  //   Duration duration = const Duration( milliseconds: 50),
  //   double begin = 0.0,
  //   double end = 1.0,
  // }) {
  //   GlobalKey<FlipCardState> cardKey = Navigate.cardKey;
  //   final transicion = PageRouteBuilder(
  //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)
  //       => paginaSiguiente,
  //     transitionDuration: Duration(milliseconds: 0),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       final parent = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  //       return FadeTransition(
  //         opacity: Tween<double>(begin: begin, end: end).animate(parent),
  //         child: FlipCard(
  //           flipOnTouch: false,
  //           key: cardKey,
  //           front: paginaAnterior,
  //           back: paginaSiguiente,
  //         ),
  //       );

  //     }
  //   );
  //   return Future.delayed(Duration(milliseconds: 0), () {
  //     Navigator.pushReplacement(context, transicion);
  //     Future.delayed(duration, () {
  //       cardKey.currentState!.toggleCard();
  //     });
  //   });
  // }

  // Scale
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica la escala principal donde 0.0 es tan pequeño que no se ve y 1.0 es la escala normal
  /// * [end] indica la escala final
  Future scale(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(milliseconds: 300),
    double begin = 0.0,
    double end = 1.0,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return ScaleTransition(
            scale: Tween<double>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.pushReplacement(context, transicion);
  }

  // Rotation
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica desde donde quieres que empieze a rotar (de 0.0 a 1.0 se da una vuelta completa,
  /// si quieres darlas al contrario de 0.0 a -1.0 es una vuelta completa)
  /// * [end] indica la posicion final
  Future rotation(
    BuildContext context, {
    required Widget pagina,
    Duration duration = const Duration(milliseconds: 300),
    double begin = 0.5,
    double end = 1.0,
  }) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return RotationTransition(
            turns: Tween<double>(begin: begin, end: end).animate(parent),
            child: child,
          );
        });
    return Navigator.pushReplacement(context, transicion);
  }

  // Fade
  /// * [duration] indica la duracion total de la animacion
  /// * [begin] indica la opacidad principal donde 0 es transparente y 1 totalmente opaco
  /// * [end] indica la opacidad final
  Future fade(BuildContext context,
      {required Widget pagina,
      Duration duration = const Duration(milliseconds: 300),
      double begin = 0.0,
      double end = 1.0}) {
    final transicion = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            pagina,
        transitionDuration: duration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final parent =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return FadeTransition(
              opacity: Tween<double>(begin: begin, end: end).animate(parent),
              child: child);
        });
    return Navigator.pushReplacement(context, transicion);
  }
}
