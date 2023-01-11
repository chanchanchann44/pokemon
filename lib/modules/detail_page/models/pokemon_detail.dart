import 'dart:convert';

PokemonDetail pokemonDetailFromJson(String str) =>
    PokemonDetail.fromJson(json.decode(str));

String pokemonDetailToJson(PokemonDetail data) => json.encode(data.toJson());

class PokemonDetail {
  PokemonDetail({
    required this.height,
    required this.weight,
    required this.types,
  });

  int height;
  int weight;
  List<TypeElement> types;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
        height: json["height"],
        weight: json["weight"],
        types: json["types"] == null
            ? []
            : List<TypeElement>.from(
                json["types"].map((x) => TypeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "types": types.isEmpty
            ? []
            : List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class TypeElement {
  TypeElement({
    required this.type,
  });

  String type;

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
        type: json["type"]["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class TypeType {
  TypeType({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypeType.fromJson(Map<String, dynamic> json) => TypeType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
