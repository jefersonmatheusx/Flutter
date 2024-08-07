class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simples';
      case Complexity.medium:
        return 'Normal';
      case Complexity.difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.cheap:
        return 'Barato';
      case Affordability.fair:
        return 'Justo';
      case Affordability.expensive:
        return 'Caro';
      default:
        return 'Desconhecida';
    }
  }
}

enum Affordability {
  cheap,
  fair,
  expensive,
  affordable,
}

enum Complexity {
  simple,
  medium,
  difficult,
}
