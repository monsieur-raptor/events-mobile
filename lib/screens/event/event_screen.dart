import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:jol/main.dart';
import 'package:jol/modules/event.dart';
import 'package:jol/theme.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:jol/screens/event/event_description.dart';
// import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({required this.event, this.heroTag, super.key});
  final Event event;
  final String? heroTag;

  Widget _buildImage() {
    final image = ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: Image.asset(
        'assets/events/${event.pic}',
        fit: BoxFit.cover,
      ),
    );

    if (heroTag != null) {
      return Hero(tag: heroTag!, child: image);
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText.appBar('Nom de l\'événement')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(aspectRatio: 1, child: _buildImage()),
            SizedBox(height: 30),
            StyledHeadlineLarge(event.title),
            SizedBox(height: 2),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.location_on_rounded,
                        size: 22,
                        color: AppColors.lightColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: event.location,
                        style: AppStyles.custom(
                          context,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.8,
                          color: AppColors.darkColor,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.darkColor,
                            ),
                            width: 4,
                            height: 4,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: event.city,
                        style: AppStyles.custom(
                          context,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.8,
                          color: AppColors.darkColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.calendar_month_rounded,
                        size: 22,
                        color: AppColors.lightColor,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: "${formatDate(event.date)} à 19:00",
                    style: AppStyles.custom(
                      context,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.8,
                      color: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: AppColors.lightColor, height: 42),

            StyledTitleSmall('À propos'),
            SizedBox(height: 12),
            EventDescription(data: event.description),

            SizedBox(height: 42),
            StyledTitleSmall('Programme'),
            SizedBox(height: 12),
            Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: StyledText(
                            '19.30',
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkColor,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: StyledText(
                            'Cocktail 1ère partie',
                            color: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.18),
              blurRadius: 42,
              spreadRadius: -12,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(vertical: 4),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.confirmation_num_rounded,
                            size: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "Réserver",
                        style: AppStyles.custom(
                          context,
                          fontSize: 16,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
