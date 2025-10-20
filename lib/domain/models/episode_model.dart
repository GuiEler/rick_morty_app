import 'package:equatable/equatable.dart';

class EpisodeModel extends Equatable {
  const EpisodeModel({
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
  final List<int> characterIds;
  final String url;
  final DateTime created;

  @override
  List<Object> get props => [
    id,
    name,
    airDate,
    episode,
    characterIds,
    url,
    created,
  ];
}
