import '../dto/genre_dto.dart';

extension GenreDtoExtension on GenreDto {
  String toModel() {
    return genre ?? '';
  }
}
