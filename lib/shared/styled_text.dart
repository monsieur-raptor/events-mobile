import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jol/theme.dart';

class AppStyles {
  // La base commune (Lato + Theme)
  static TextStyle _baseLato(BuildContext context) {
    return GoogleFonts.lato(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  static TextStyle appBar(BuildContext context) {
    return _baseLato(context).copyWith(
      color: AppColors.darkColor,
      fontWeight: FontWeight.w500,
      height: 1,
      fontSize: 18,
    );
  }

  // Markdown
  static TextStyle body(BuildContext context) {
    return _baseLato(context).copyWith(height: 1.7, fontSize: 17);
  }

  // Une méthode flexible pour le style général
  static TextStyle custom(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
  }) {
    return _baseLato(context).copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;
  final TextStyle Function(BuildContext) styleBuilder;
  final TextAlign? textAlign;

  // Constructeur standard
  StyledText(
    this.text, {
    super.key,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    this.textAlign,
  }) : styleBuilder = ((context) => AppStyles.custom(
         context,
         color: color,
         fontWeight: fontWeight,
         fontSize: fontSize,
         height: height,
       ));

  // Constructeur nommé AppBar
  const StyledText.appBar(this.text, {super.key})
    : styleBuilder = AppStyles.appBar,
      textAlign = null;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: styleBuilder(context),
      textAlign: textAlign,
    );
  }
}

class StyledSmallText extends StatelessWidget {
  const StyledSmallText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

class StyledHeadlineLarge extends StatelessWidget {
  const StyledHeadlineLarge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.raleway(
        textStyle: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class StyledHeadlineMedium extends StatelessWidget {
  const StyledHeadlineMedium(
    this.text, {
    super.key,
    this.overflow,
    this.fontSize,
  });

  final String text;
  final TextOverflow? overflow;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.headlineMedium;
    return Text(
      text,
      style: GoogleFonts.raleway(textStyle: baseStyle).copyWith(
        overflow: overflow ?? baseStyle?.overflow,
        fontSize: fontSize ?? baseStyle?.fontSize,
      ),
      softWrap: false,
    );
  }
}

class StyledTitleMedium extends StatelessWidget {
  const StyledTitleMedium(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class StyledTitleSmall extends StatelessWidget {
  const StyledTitleSmall(
    this.text, {
    super.key,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.color,
  });

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleSmall;
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.raleway(
        color: color ?? baseStyle?.color,
        fontWeight: fontWeight ?? baseStyle?.fontWeight,
        letterSpacing: letterSpacing ?? baseStyle?.letterSpacing,
        fontSize: fontSize ?? baseStyle?.fontSize,
      ),
    );
  }
}
