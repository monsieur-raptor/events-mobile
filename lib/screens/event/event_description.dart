import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:jol/theme.dart';
import 'package:jol/shared/styled_text.dart';

class EventDescription extends StatelessWidget {
  final String data;

  const EventDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: data,
      // On utilise un StyleSheet pour forcer le Markdown à utiliser TES polices
      styleSheet: MarkdownStyleSheet(
        p: AppStyles.body(context),
        listBullet: TextStyle(
          color: AppColors.darkColor,
        ), // Ta couleur d'agence
        blockSpacing: 16.0, // Espace entre les paragraphes
      ),
      selectable: true, // Permet à l'utilisateur de copier du texte
    );
  }
}
