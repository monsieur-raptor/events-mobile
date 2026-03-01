import 'package:flutter/material.dart';
// import 'package:jol/screens/event/event_screen.dart';
import 'package:jol/screens/home/home.dart';
import 'package:jol/theme.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Fonction de conversion de la date
String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('d MMMM', 'fr_FR').format(dateTime);
}

final now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);

void main() async {
  await initializeDateFormatting('fr_FR', null);
  runApp(MaterialApp(theme: primaryTheme, home: Home()));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText.appBar('Sandbox')),
      body: Placeholder(),
    );
  }
}
