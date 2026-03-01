import 'package:flutter/material.dart';
import 'package:jol/main.dart';
import 'package:jol/modules/event.dart';
import 'package:jol/screens/event/event_screen.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:jol/theme.dart';

class EventList extends StatelessWidget {
  const EventList({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => EventScreen(event: event),
          ),
        );
      },
      child: Card(
        color: AppColors.lightBackground,
        elevation: 0.0,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(3),
                        child: Image.asset(
                          'assets/events/${event.pic}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: event.type.color,
                        ),
                        child: StyledTitleSmall(
                          event.type.name,

                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    child: StyledTitleMedium(event.title),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              size: 20,
                              color: AppColors.lightColor,
                            ),
                          ),
                          SizedBox(width: 6),
                          StyledText(
                            formatDate(event.date),
                            color: AppColors.darkColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 20,
                              color: AppColors.lightColor,
                            ),
                          ),
                          SizedBox(width: 6),
                          StyledText(
                            event.city,
                            color: AppColors.darkColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
