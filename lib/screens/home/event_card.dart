import 'package:flutter/material.dart';
import 'package:jol/main.dart';
import 'package:jol/modules/event.dart';
import 'package:jol/screens/event/event_screen.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:jol/theme.dart';

class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => EventScreen(
                  event: event,
                  heroTag: 'eventImage-${event.id}',
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
            color: AppColors.lightBackground,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Hero(
                              tag: 'eventImage-${event.id}',
                              child: Image.asset(
                                'assets/events/${event.pic}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: BoxBorder.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              color: event.type.color,
                            ),
                            child: StyledTitleSmall(
                              event.type.name,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28),
                  StyledHeadlineMedium(
                    event.title,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 8),
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
                            event.location,
                            color: AppColors.darkColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
