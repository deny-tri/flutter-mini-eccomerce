part of 'utilities.dart';

background() => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1),
        colors: <Color>[
          Color(0xff1f005c),
          Color(0xff1f005c),
          Color(0xff5b0060),
          Color(0xff870160),
          Color(0xffca485c),
          Color(0xffe16b5c),
          Color(0xffffb56b),
          Color(0xffffb56b),
        ], // Gradient from https://learnui.design/tools/gradient-generator.html
        tileMode: TileMode.mirror,
      ),
    );
appGradient() => const LinearGradient(colors: [
      Color(0xff1f005c),
      Color(0xff1f005c),
      Color(0xff5b0060),
      Color(0xff870160),
      Color(0xffca485c),
      Color(0xffe16b5c),
      Color(0xffffb56b),
      Color(0xffffb56b),
    ]);
