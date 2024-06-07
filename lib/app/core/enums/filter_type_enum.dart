enum FilterTypeEnum {
  uf,
  city,
  street;

  String? get label => switch (this) {
        uf => 'UF',
        city => 'Cidade',
        street => 'Logradouro',
      };
}
