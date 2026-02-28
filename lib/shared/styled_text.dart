import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jol/theme.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    super.key,
    this.color, // Paramètre optionnel pour la couleur
    this.fontWeight, // Paramètre optionnel pour le gras
    this.fontSize,
  });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  StyledText.appBar(this.text, {super.key})
    : color = AppColors.darkColor,
      fontWeight = FontWeight.w500,
      fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          GoogleFonts.lato(
            fontWeight: fontWeight,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ).copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
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
