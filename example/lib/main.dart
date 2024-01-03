import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

class AppColors {
  static Color backgroundBlack = const Color(0xff101E21);
  static Color cardBlack = const Color(0xff203238);
  static Color white = const Color(0xffFFFFFF);
  static Color iconColor = const Color(0xffCBCBCB);
  static Color buttonColor = const Color(0xff8C32D3);
  static Color iconColors = const Color(0xff25A792);
  static Color seeAllblack = const Color(0xff212227);

  static var borderColor = Color(0xff969696);

  static var offWhite = Color(0xffDEDEDE);
  static var dividerColor = Color(0xff8B8B8B);
}

var theme = ThemeData(
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.backgroundBlack,
    primary: AppColors.cardBlack,
    background: AppColors.backgroundBlack,
    secondary: AppColors.cardBlack,
    onBackground: AppColors.buttonColor,
  ),
  iconTheme: IconThemeData(color: AppColors.white),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundBlack,
  textTheme: TextThemes.textTheme,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextStyleEditor Demo',
      theme: theme,
      // theme: ThemeData.dark(),
      home: MyHomePage(title: 'TextStyleEditor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  List<Color> paletteColors = [
    Colors.black,
    Colors.white,
    Color(int.parse('0xffEA2027')),
    Color(int.parse('0xff006266')),
    Color(int.parse('0xff1B1464')),
    Color(int.parse('0xff5758BB')),
    Color(int.parse('0xff6F1E51')),
    Color(int.parse('0xffB53471')),
    Color(int.parse('0xffEE5A24')),
    Color(int.parse('0xff009432')),
    Color(int.parse('0xff0652DD')),
    Color(int.parse('0xff9980FA')),
    Color(int.parse('0xff833471')),
    Color(int.parse('0xff112CBC4')),
    Color(int.parse('0xffFDA7DF')),
    Color(int.parse('0xffED4C67')),
    Color(int.parse('0xffF79F1F')),
    Color(int.parse('0xffA3CB38')),
    Color(int.parse('0xff1289A7')),
    Color(int.parse('0xffD980FA'))
  ];
  late TextStyle textStyle;
  late TextAlign textAlign;

  @override
  void initState() {
    textStyle = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontFamily: 'OpenSans',
    );

    textAlign = TextAlign.left;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: textStyle,
                  textAlign: textAlign,
                  maxLines: 10,
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Container(
                height: 400,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: TextStyleEditor(
                    fonts: fonts,
                    paletteColors: paletteColors,
                    textStyle: textStyle,
                    textAlign: textAlign,
                    initialTool: EditorToolbarAction.fontFamilyTool,
                    onTextAlignEdited: (align) {
                      setState(() {
                        textAlign = align;
                      });
                    },
                    onTextStyleEdited: (style) {
                      setState(() {
                        textStyle = textStyle.merge(style);
                      });
                    },
                    onCpasLockTaggle: (caps) {
                      print(caps);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return const TextTheme(
      bodyLarge: AppTextStyles.bodyLg,
      bodyMedium: AppTextStyles.body,
      titleMedium: AppTextStyles.bodySm,
      titleSmall: AppTextStyles.bodyXs,
      displayLarge: AppTextStyles.h1,
      displayMedium: AppTextStyles.h2,
      displaySmall: AppTextStyles.h3,
      headlineMedium: AppTextStyles.h4,
    ).apply(
      bodyColor: AppColors.white,
      decorationColor: AppColors.white,
      displayColor: AppColors.white,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.white),
      displayLarge: AppTextStyles.h1.copyWith(color: AppColors.white),
      displayMedium: AppTextStyles.h2.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.h3.copyWith(color: AppColors.white),
      headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.white),
    );
  }

  /// Primary text theme

  // static TextTheme get primaryTextTheme {
  //   return TextTheme(
  //     bodyLarge: AppTextStyles.bodyLg.copyWith(color: AppColors.primary),
  //     bodyMedium: AppTextStyles.body.copyWith(color: AppColors.primary),
  //     titleMedium: AppTextStyles.bodySm.copyWith(color: AppColors.primary),
  //     titleSmall: AppTextStyles.bodyXs.copyWith(color: AppColors.primary),
  //     displayLarge: AppTextStyles.h1.copyWith(color: AppColors.primary),
  //     displayMedium: AppTextStyles.h2.copyWith(color: AppColors.primary),
  //     displaySmall: AppTextStyles.h3.copyWith(color: AppColors.primary),
  //     headlineMedium: AppTextStyles.h4.copyWith(color: AppColors.primary),
  //   );
  // }
}

class AppTextStyles {
  static const String fontFamily = 'Poppins';

  /// Text style for body
  static const TextStyle bodyLg = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle body = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle bodySm = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle bodyXs = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  /// Text style for heading

  static const TextStyle h1 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle h2 = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle h3 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);

  static const TextStyle h4 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
      overflow: TextOverflow.ellipsis);
}
