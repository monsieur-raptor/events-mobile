import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jol/screens/home/event_card.dart';
import 'package:jol/screens/home/event_list.dart';
import 'package:jol/main.dart';
import 'package:jol/modules/event.dart';
import 'package:jol/theme.dart';
import 'package:jol/shared/styled_text.dart';
import 'package:jol/extensions/event_list_extension.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Set<EventType> _selectedType = {};

  String _monthName(int month) {
    final date = DateTime(2000, month);
    final name = DateFormat('MMMM', 'fr_FR').format(date);
    return name[0].toUpperCase() + name.substring(1);
  }

  // Filtres
  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(19, 6, 19, 18),
      child: Row(
        children: [
          ...EventType.values.map((type) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(
                  type.name.toUpperCase(),
                  style: GoogleFonts.raleway(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: _selectedType.contains(type)
                        ? Colors.white
                        : AppColors.darkColor,
                  ),
                ),
                selected: _selectedType.contains(type),
                onSelected: (_) => setState(() {
                  if (_selectedType.contains(type)) {
                    _selectedType.remove(type);
                  } else {
                    _selectedType.add(type);
                  }
                }),
                backgroundColor: Colors.white,
                selectedColor: type.color,
                shape: ContinuousRectangleBorder(
                  side: BorderSide(
                    color: _selectedType.contains(type)
                        ? type.color
                        : Colors.black,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                clipBehavior: Clip.antiAlias,
              ),
            );
          }),
        ],
      ),
    );
  }

  // Liste d'événements hors highlighted (sliver)
  Widget _buildEventSliver(List<Event> eventList) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return EventList(event: eventList[index]);
        },
        separatorBuilder: (context, index) =>
            Divider(height: 40, thickness: 2, color: Colors.grey[300]),
      ),
    );
  }

  List<Widget> _buildLaterSection(
    Map<int, Map<int, List<Event>>> grouped,
  ) {
    final slivers = <Widget>[];

    if (grouped.isEmpty) {
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverToBoxAdapter(
            child: Text('Aucun événement à venir'),
          ),
        ),
      );
      return slivers;
    }

    final sortedYears = grouped.keys.toList()..sort();

    for (final year in sortedYears) {
      // Header année
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: StyledHeadlineLarge('Programme $year'),
          ),
        ),
      );

      // Chips de filtre
      if (year == today.year) {
        slivers.add(SliverToBoxAdapter(child: _buildFilterChips()));
      }

      final months = grouped[year]!;
      final sortedMonths = months.keys.toList()..sort();

      // Filtrer les événements de cette année par type
      final hasEventsThisYear = sortedMonths.any((month) {
        return months[month]!.any(
          (e) =>
              _selectedType.isEmpty || _selectedType.contains(e.type),
        );
      });

      if (!hasEventsThisYear) {
        slivers.add(
          SliverPadding(
            padding: const EdgeInsets.all(28),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyledText(
                    "Il n'y a pas encore d'événement prévu correspondant à votre sélection",
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 34),
                  SvgPicture.asset(
                    'assets/empty_states/empty-state.svg',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        );
        continue; // Passe à l'année suivante
      }

      for (final month in sortedMonths) {
        // Filtrer les événements du mois
        final filteredEvents = months[month]!
            .where(
              (e) =>
                  _selectedType.isEmpty ||
                  _selectedType.contains(e.type),
            )
            .toList();

        if (filteredEvents.isEmpty) continue; // Mois vide après filtre

        // Header mois
        slivers.add(
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 26,
              ),
              child: StyledTitleSmall(
                '${_monthName(month)} $year',
                fontSize: 26,
              ),
            ),
          ),
        );

        // Liste des événements
        slivers.add(_buildEventSliver(filteredEvents));
      }
    }

    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    // Events mis en avant
    final highlightedEvents = events
        .highlighted()
        .forYear(now.year)
        .sortByDate();

    // Events du mois
    final thisMonth = events
        .excludePast()
        .forMonth(today.year, today.month)
        .sortByDate();

    // Events mois prochain
    final nextMonth = events
        .excludePast()
        .forMonth(today.year, today.month + 1)
        .sortByDate();

    // Events à venir
    final later = events
        .excludePast()
        .startMonth(1)
        .sortByDate()
        .groupByYearAndMonth();

    return MaterialApp(
      theme: primaryTheme,
      home: Scaffold(
        appBar: AppBar(title: StyledText.appBar('Bonjour, Homer !')),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Titre
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsGeometry.fromLTRB(
                  16,
                  16,
                  16,
                  0,
                ),
                child: StyledHeadlineLarge('événements en avant'),
              ),
            ),

            // Cards en avant
            SliverToBoxAdapter(
              child: SizedBox(
                height: 450,
                child: ListView.separated(
                  cacheExtent: 1000,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final event = highlightedEvents[index];
                    return EventCard(event: event);
                  },
                  itemCount: highlightedEvents.length,

                  separatorBuilder: (context, index) =>
                      SizedBox(width: 4),
                ),
              ),
            ),

            // Ce mois-ci
            if (thisMonth.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsGeometry.fromLTRB(
                    16,
                    16,
                    16,
                    26,
                  ),
                  child: StyledHeadlineLarge('Ce mois-ci'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemCount: thisMonth.length,
                  itemBuilder: (context, index) {
                    final event = thisMonth[index];
                    return EventList(event: event);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],

            // Le mois prochain
            if (nextMonth.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 26,
                  ),
                  child: StyledHeadlineLarge('Le mois prochain'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemCount: nextMonth.length,
                  itemBuilder: (context, index) {
                    final event = nextMonth[index];
                    return EventList(event: event);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
              ),

              // Plus tard
              ..._buildLaterSection(later),
            ],
          ],
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
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 32,
            currentIndex: 0, // L'index de l'élément sélectionné
            onTap: (index) {
              // Logique pour changer de page
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                activeIcon: Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  ),
                ),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_num_rounded),
                label: 'Réservations',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: 'Panier',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_rounded),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Réglages',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
