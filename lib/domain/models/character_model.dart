import 'package:equatable/equatable.dart';

import 'models.dart';

class CharacterModel extends Equatable {
  const CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationModel origin;
  final CharacterLocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  @override
  List<Object> get props => [
    id,
    name,
    status,
    species,
    type,
    gender,
    origin,
    location,
    image,
    episode,
    url,
    created,
  ];
}
