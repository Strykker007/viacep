import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchParams {
  String? country;
  String? city;
  String? street;
  String? cep;
  SearchParams({
    this.country,
    this.city,
    this.street,
    this.cep,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'city': city,
      'street': street,
      'cep': cep,
    };
  }

  factory SearchParams.fromMap(Map<String, dynamic> map) {
    return SearchParams(
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchParams.fromJson(String source) => SearchParams.fromMap(json.decode(source) as Map<String, dynamic>);

  SearchParams copyWith({
    String? country,
    String? city,
    String? street,
    String? cep,
  }) {
    return SearchParams(
      country: country ?? this.country,
      city: city ?? this.city,
      street: street ?? this.street,
      cep: cep ?? this.cep,
    );
  }
}
