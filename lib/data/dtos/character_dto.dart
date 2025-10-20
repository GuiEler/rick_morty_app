import 'package:path/path.dart' as path;

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';
import 'dtos.dart';

class CharacterDto {
  CharacterDto({
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
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationDto origin;
  final CharacterLocationDto location;
  final String image;
  final List<String> episodeIds;
  final String url;
  final String created;

  factory CharacterDto.fromMap(Map<String, dynamic> map) {
    try {
      return CharacterDto(
        id: map['id'],
        name: map['name'],
        status: map['status'],
        species: map['species'],
        type: map['type'],
        gender: map['gender'],
        origin: CharacterLocationDto.fromMap(map['origin']),
        location: CharacterLocationDto.fromMap(map['location']),
        image: map['image'],
        episodeIds: map['episode'] is List
            // ignore: unnecessary_lambdas
            ? List<String>.from((map['episode'] as List).map((url) => path.basename(url)))
            : [],
        url: map['url'],
        created: map['created'],
      );
    } catch (_) {
      throw const InvalidDataError();
    }
  }

  CharacterModel toModel() {
    try {
      return CharacterModel(
        id: id,
        name: name,
        status: CharacterStatus.values.firstWhere(
          (e) => e.value.toLowerCase() == status.toLowerCase(),
          orElse: () => CharacterStatus.unknown,
        ),
        species: species,
        type: type,
        gender: CharacterGender.values.firstWhere(
          (e) => e.value.toLowerCase() == gender.toLowerCase(),
          orElse: () => CharacterGender.unknown,
        ),
        origin: origin.toModel(),
        location: location.toModel(),
        image: image,
        episodeIds: episodeIds.map(int.parse).toList(),
        url: url,
        created: DateTime.parse(created),
      );
    } catch (_) {
      throw const InvalidDataError();
    }
  }
}
