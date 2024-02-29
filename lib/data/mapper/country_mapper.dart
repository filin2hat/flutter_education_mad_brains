import '../dto/country_dto.dart';

extension CountryDtoExtension on CountryDto {
  String toModel() {
    return country ?? '';
  }
}
