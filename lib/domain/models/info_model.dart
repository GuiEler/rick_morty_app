import 'package:equatable/equatable.dart';

class InfoModel extends Equatable {
  const InfoModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [count, pages, next, prev];
}
