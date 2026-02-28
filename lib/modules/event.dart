import 'package:flutter/material.dart';

class Event {
  Event({
    required this.title,
    required this.type,
    required this.location,
    required this.city,
    required this.date,
    required this.id,
    required this.pic,
    required this.isHighlighted,
  });

  final String title;
  final EventType type;
  final String location;
  final String city;
  final String date;
  final String id;
  final String pic;
  final bool isHighlighted;
}

enum EventType {
  show(name: "Spectacle", color: Colors.red),
  culture(name: "Culture", color: Colors.lightBlue),
  sport(name: "Sport", color: Colors.green),
  members(name: "Membres", color: Colors.black87);

  const EventType({required this.name, required this.color});

  final String name;
  final Color color;
}

List<Event> events = [
  Event(
    title: 'Arnaud Tsamere',
    type: EventType.show,
    location: 'Théâtre de Champagne',
    city: 'Troyes',
    date: '2027-03-25',
    id: '1',
    pic: 'tsamere.jpg',
    isHighlighted: true,
  ),
  Event(
    title: 'Mathieu Madenian',
    type: EventType.show,
    location: 'Théâtre de Champagne',
    city: 'Troyes',
    date: '2026-04-29',
    id: '2',
    pic: 'madenian.jpg',
    isHighlighted: false,
  ),
  Event(
    title: 'Irish Celtic',
    type: EventType.show,
    location: 'Le Cube',
    city: 'Troyes',
    date: '2026-03-28',
    id: '3',
    pic: 'irish_celtic.jpg',
    isHighlighted: true,
  ),
  Event(
    title: 'Mon Jour de Chance',
    type: EventType.culture,
    location: 'Théâtre de Champagne',
    city: 'Troyes',
    date: '2026-04-18',
    id: '4',
    pic: 'jour_chance.jpg',
    isHighlighted: true,
  ),
  Event(
    title: 'Le Casse de l\'Année',
    type: EventType.show,
    location: 'Le Cube',
    city: 'Troyes',
    date: '2026-06-27',
    id: '5',
    pic: 'casse_annee.jpg',
    isHighlighted: false,
  ),
  Event(
    title: 'Garou',
    type: EventType.show,
    location: 'Accor Hotel Arena',
    city: 'Paris',
    date: '2026-12-09',
    id: '5',
    pic: 'garou.jpg',
    isHighlighted: true,
  ),
  Event(
    title: 'Les Années 80',
    type: EventType.show,
    location: 'Le Cube',
    city: 'Troyes',
    date: '2026-10-04',
    id: '6',
    pic: '80.jpg',
    isHighlighted: false,
  ),
  Event(
    title: 'Tournoi de Roland Garros',
    type: EventType.sport,
    location: 'Porte d\'Autueuil',
    city: 'Paris',
    date: '2026-06-07',
    id: '7',
    pic: 'roland_garros.jpg',
    isHighlighted: true,
  ),
];
