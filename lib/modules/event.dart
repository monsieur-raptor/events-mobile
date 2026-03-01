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
    required this.description,
  });

  final String title;
  final EventType type;
  final String location;
  final String city;
  final String date;
  final String id;
  final String pic;
  final bool isHighlighted;
  final String description;
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
    description: """
Après le succès de son précédent spectacle « 2 mariages et 1 enterrement » 
joué en France, Belgique, Suisse, Luxembourg et actuellement disponible sur Canal +,
un passage par le théâtre classique dans le rôle de Cyrano de Bergerac mis en scène 
par Alain Sachs, et la retentissante tournée du Trio avec ses deux acolytes 
Jérémy Ferrari et Baptiste Lecaplain, Arnaud Tsamere, l’humoriste applaudi par 
plus de 500 000 spectateurs en salle revient sur scène en janvier 2026 avec un 
5ème One Man Show plus intense que jamais !
    """,
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
    description: """
«A PLEURER DE RIRE», c'est la promesse que fait Mathieu Madenian avec ce quatrième 
et nouveau spectacle dans lequel il nous raconte avec son sens inouï de 
l'autodérision comment sa vie et ses certitudes les plus profondes ont été 
bouleversées par l'arrivée tardive de son premier enfant. 

Pendant une heure menée à tambours battants, Mathieu nous embarque dans une plongée à 
travers l'univers tumultueux d'un père nouvellement émoulu qui tente de jongler avec 
l'absurdité d'un monde au bord du chaos tout en apprenant les ficelles de la paternité.

Comment concilier son éducation traditionnelle avec la nouvelle vague de paternité 
moderne ? Comment expliquer à son fils les concepts de genre... alors qu'il ne 
maîtrise même pas TikTok ? Et surtout, comment ne pas passer pour un boomer largué ? 

Avec ce talent unique pour transformer le quotidien en comédie, Mathieu nous offre 
un spectacle où il parle de ses erreurs, de ses ratés, et des leçons qu'il tire de son 
petit garçon, qui, à peine né, semble déjà en savoir plus sur la vie que lui.

Un voyage hilarant et émouvant dans lequel Mathieu nous livre son spectacle à la 
fois le plus personnel et le plus universel.
    """,
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
    description: """
C’est un cru de 15 ans d’âge qui se bonifie avec le temps !

Après 1 million de spectateurs à travers le monde, Irish Celtic « Spirit of Ireland » 
est de retour et fête son 15ème anniversaire !

Découvrez l’histoire de Paddy Flynn, ce vieil Irlandais alcoolique, propriétaire de son pub depuis des décennies, 
et sur le point de le léguer à son fils.
Ce dernier, insouciant, préfère danser plutôt que servir les clients du Irish Celtic Pub. 
Avant de devenir propriétaire, Diarmuid doit apprendre l'histoire de son pays.

Venez découvrir les légendes, les chansons, les danses et les mystères 
de l’île d’émeraude...
    """,
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
    description: """
Que feriez-vous si vous pouviez revenir en arrière et modifier le cours de votre vie ?

Sébastien passe un week-end avec des amis d’enfance. 
Ils se souviennent qu’à l’époque ils laissaient le sort décider pour eux 
et prenaient toutes leurs décisions en jouant au dé. 

Sébastien se rappelle précisément d’un soir où il a fait un quatre. 
Si seulement il avait fait un six, sa vie aurait été bien plus belle. 
Il en est convaincu.
Et si le destin lui donnait l’occasion de rejouer ?

Une pièce de Patrick Haudecœur et Gérald Sibleyras

__Mise en scène__  
José Paul

__Avec__  
Guillaume de Tonquédec  
Loïc Legendre  
Lysiane Meis  
Jean Franco  
Caroline Maillard


__Décors__  
Édouard Laug

__Costumes__  
Ana Belen Palacios Avila

__Lumière__  
Laurent Béal

__Musique__  
Michel Winogradoff
    """,
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
    description: """
Le casse de l'année Caterina Khéroul est une cambrioleuse de renom, 
assidument recherchée par les polices du monde entier. 

Son nouveau « gros coup » a, comme à son habitude, été minutieusement préparé, 
réglé dans les moindres détails… Cette fois elle vient récupérer un bijou historique 
et inestimable dans la maison d'un joueur star du PSG, pendant qu'il est en plein match. 

Seul imprévu - et de taille : le même soir et au même moment, Sam, 
un cambrioleur débutant de petite envergure, vraiment pas doué, 
a également décidé́ de s'attaquer à la maison ! I

l y a donc une voleuse ou un voleur de trop dans la villa de Marne-la-Coquette, 
sans compter les nouveaux arrivants ! À moins, que par la force des choses, 
et pour notre plus grand plaisir, ils ne soient tous obligés de s'associer…
    """,
  ),
  Event(
    title: 'Garou',
    type: EventType.show,
    location: 'Accor Hotel Arena',
    city: 'Paris',
    date: '2026-12-09',
    id: '6',
    pic: 'garou.jpg',
    isHighlighted: true,
    description: """
Garou dévoile son premier album d'auteur-compositeur "Un meilleur lendemain"
avec un spectacle solo mêlant confidences musicales et scénographie captivante.
    """,
  ),
  Event(
    title: 'Les Années 80',
    type: EventType.show,
    location: 'Le Cube',
    city: 'Troyes',
    date: '2026-10-04',
    id: '7',
    pic: '80.jpg',
    isHighlighted: false,
    description: """
Les Années 80, La Tournée c’est une grande fête 100% Live avec LIO, 
PLASTIC BERTRAND, LÂÂM, PARTENAIRE PARTICULIER, BONEY M LEGEND, JEAN SCHULTHEIS, 
SLOANE, CHRISTIAN DE RAFT, JEAN-PIERRE MORGAND, PEDRO CASTANO (MACARENA)… 
Ils sont réunis sur scène pour vous faire (re)vivre en live leurs plus grands 
tubes de vos années cultes. Assistez à un show, avec leurs musiciens, 
où tout a été pensé pour une soirée d'anthologie !
    """,
  ),
  Event(
    title: 'Tournoi de Roland Garros',
    type: EventType.sport,
    location: 'Porte d\'Autueuil',
    city: 'Paris',
    date: '2026-06-07',
    id: '8',
    pic: 'roland_garros.jpg',
    isHighlighted: true,
    description: """
Accédez aux meilleures places, à des espaces exclusifs, 
bénéficiez de services sur-mesure et profitez du confort ultime à quelques pas 
des plus grands joueurs.

Avec nos packages VIP Roland-Garros, vivez l’événement dans des conditions privilégiées. 
Réservez votre place VIP pour suivre le tournoi sous son meilleur angle !
    """,
  ),
];
