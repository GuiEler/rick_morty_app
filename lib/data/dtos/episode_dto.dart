import 'package:path/path.dart' as path;

import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';

class EpisodeDto {
  EpisodeDto({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characterIds,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characterIds;
  final String url;
  final String created;

  factory EpisodeDto.fromMap(Map<String, dynamic> map) {
    try {
      return EpisodeDto(
        id: map['id'],
        name: map['name'],
        airDate: map['air_date'],
        episode: map['episode'],
        characterIds: map['characters'] is List
            // ignore: unnecessary_lambdas
            ? List<String>.from((map['characters'] as List).map((url) => path.basename(url)))
            : [],
        url: map['url'],
        created: map['created'],
      );
    } catch (_) {
      throw const InvalidDataError();
    }
  }

  EpisodeModel toModel() {
    try {
      return EpisodeModel(
        id: id,
        name: name,
        airDate: airDate,
        episode: episode,
        characterIds: characterIds.map(int.parse).toList(),
        url: url,
        created: DateTime.parse(created),
      );
    } catch (_) {
      throw const InvalidDataError();
    }
  }
}
