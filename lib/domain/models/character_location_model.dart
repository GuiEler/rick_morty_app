import 'package:equatable/equatable.dart';

class CharacterLocationModel extends Equatable {
  const CharacterLocationModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
