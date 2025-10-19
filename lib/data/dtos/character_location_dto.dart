import '../../domain/errors/errors.dart';
import '../../domain/models/models.dart';

class CharacterLocationDto {
  CharacterLocationDto({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterLocationDto.fromMap(Map<String, dynamic> map) {
    try {
      return CharacterLocationDto(
        name: map['name'],
        url: map['url'],
      );
    } catch (_) {
      throw const InvalidDataError();
    }
  }

  CharacterLocationModel toModel() => CharacterLocationModel(name: name, url: url);
}
