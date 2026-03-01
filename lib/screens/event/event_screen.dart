import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jol/main.dart';
import 'package:jol/modules/event.dart';
import 'package:jol/theme.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:jol/screens/event/event_description.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({this.event, super.key});
  final Event? event;

  @override
  Widget build(BuildContext context) {
    final testEvent = event ?? events[2];
    return Scaffold(
      appBar: AppBar(title: StyledText.appBar('Nom de l\'événement')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset(
                    'assets/events/${testEvent.pic}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              StyledHeadlineLarge(testEvent.title),
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
                          text: testEvent.location,
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
                          text: testEvent.city,
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
                      text: "${formatDate(testEvent.date)} à 19:00",
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
              EventDescription(data: testEvent.description),

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
      ),
    );
  }
}
