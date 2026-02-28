import 'package:jol/modules/event.dart';
import 'package:jol/main.dart';

extension EventListExtension on List<Event> {
  /// Trier les events par date
  List<Event> sortByDate() {
    return toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  /// Exclure des events passés
  List<Event> excludePast() {
    return where((element) {
      final date = DateTime.tryParse(element.date) ?? DateTime(1900);
      return !date.isBefore(today);
    }).toList();
  }

  /// Filtrer les événements d'une année précise
  List<Event> forYear(int year) {
    return where((element) {
      final date = DateTime.tryParse(element.date);
      if (date == null) return false;
      return date.year == year;
    }).toList();
  }

  /// Filtrer les événements sur un mois précis
  List<Event> forMonth(int year, int month) {
    return where((element) {
      final date = DateTime.tryParse(element.date);
      if (date == null) return false;
      return date.year == year && date.month == month;
    }).toList();
  }

  /// Lister les événements à partir d'un mois précis
  List<Event> startMonth(int count) {
    final limit = DateTime(today.year, today.month + count + 1, 1);
    return where((element) {
      final date = DateTime.tryParse(element.date);
      if (date == null) return false;
      return !date.isBefore(limit);
    }).toList();
  }

  /// Grouper les événements par mois ("yyyy-mm")
  Map<String, List<Event>> groupByMonth() {
    final map = <String, List<Event>>{};
    for (final event in this) {
      final date = DateTime.tryParse(event.date);
      if (date == null) continue;
      final key =
          '${date.year}-${date.month.toString().padLeft(2, '0')}';
      map.putIfAbsent(key, () => []).add(event);
    }
    return map;
  }

  /// Grouper les événements pas année puis par mois
  Map<int, Map<int, List<Event>>> groupByYearAndMonth() {
    final map = <int, Map<int, List<Event>>>{};
    for (final event in this) {
      final date = DateTime.tryParse(event.date);
      if (date == null) continue;
      map
          .putIfAbsent(date.year, () => {})
          .putIfAbsent(date.month, () => [])
          .add(event);
    }
    return map;
  }

  /// Filtrer les événments mis en avant
  List<Event> highlighted() {
    return where((element) => element.isHighlighted).toList();
  }

  /// Filtrer par type d'événément
  List<Event> byTypes(Set<EventType> types) {
    if (types.isEmpty) return toList();
    return where((element) => types.contains(element.type)).toList();
  }
}
