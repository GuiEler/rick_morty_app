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
    required this.episodeIds,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String type;
  final CharacterGender gender;
  final CharacterLocationModel origin;
  final CharacterLocationModel location;
  final String image;
  final List<int> episodeIds;
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
    episodeIds,
    url,
    created,
  ];
}

enum CharacterStatus {
  alive('Alive'),
  dead('Dead'),
  unknown('unknown');

  final String value;
  const CharacterStatus(this.value);
}

enum CharacterGender {
  male('Male'),
  female('Female'),
  genderless('Genderless'),
  unknown('unknown');

  final String value;
  const CharacterGender(this.value);
}
