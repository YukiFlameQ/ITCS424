class Recipe {
  String label;
  String imageUrl;
  // TODO: Add servings and ingredients here
  int servings;
  List<Ingredient> ingredients;

  Recipe(
      this.label,
      this.imageUrl,
      this.servings,
      this.ingredients,
      );

// TODO; Add List<Recipe> here

  static List<Recipe> samples = [
    Recipe(
      'Hongshao paigu',
      'picture/paigu.jpg',
      4,
      [
        Ingredient(5, 'gram', 'ginger',),
        Ingredient(3, 'gram', 'scallion',),
        Ingredient(4, 'gram', 'cinnamon',),
        Ingredient(2, ' ', 'anise',),

      ],
    ),

    Recipe(
      'Steamed eggs',
      'picture/egg.jpg',
      2,
      [
        Ingredient(0.2, 'Tablespoon', 'salt',),
        Ingredient(0.3, 'Tablespoon', 'oil',),
        Ingredient(0.3, 'Tablespoon', 'chicken essence',),
      ],
    ),
    Recipe(
      'Toufu',
      'picture/toufu.jpg',
      1,
      [
        Ingredient(50, 'gram', 'beef',),
        Ingredient(1, 'pice', 'tofu',),
        Ingredient(1, 'gram', 'Pepper noodles',),
        Ingredient(15, 'gram', 'soy sauce',),
        Ingredient(20, 'gram', 'garlic',),
        Ingredient(2, 'gram', 'solt',),
      ],
    ),
    Recipe(
      'Mixian',
      'picture/mixian.jpg',
      24,
      [
        Ingredient(1, 'tablespoon', 'salt',),
        Ingredient(1, 'tablespoon', 'Soy sauce',),
        Ingredient(0.5, 'tablespoon', 'sugar',),
        Ingredient(1, 'tablespoon', 'Vegetable oil',),
        Ingredient(1, 'tablespoon', 'Fresh Pepper ',),
        Ingredient(1, 'tablespoon', 'Parsley root',),
      ],
    ),
    Recipe(
      'Braised noodle',
      'picture/noodle.jpg',
      1,
      [
        Ingredient(1, 'tablespoon', 'salt',),
        Ingredient(1, 'tablespoon', 'Soy sauce',),
        Ingredient(0.5, 'tablespoon', 'sugar',),
        Ingredient(1, 'tablespoon', 'Vegetable oil',),
        Ingredient(1, 'tablespoon', 'Fresh Pepper ',),
        Ingredient(1, 'tablespoon', 'Parsley root',),
      ],
    ),

  ];

}

// TODO: Add Ingredient() here
class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(
      this.quantity,
      this.measure,
      this.name,
      );
}

