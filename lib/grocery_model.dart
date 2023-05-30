class GroceryModel {
  String name;
  double price;
  String desc;
  String img;
  int weight;
  String id;
  int? qty;
  GroceryModel({
    this.qty,
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
    required this.img,
    required this.weight,
  });
}

List<GroceryModel> products = [
  GroceryModel(
    id: "1",
    name: "Spelt fusilli",
    price: 49.33,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres  Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    weight: 400,
    img: "asset/spelt-fusilli.png",
  ),
  GroceryModel(
    id: "2",
    name: "Rummo fusilli",
    price: 22.63,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    img: "asset/rummo-fusilli.png",
    weight: 200,
  ),
  GroceryModel(
    id: "3",
    name: "Newman's own",
    price: 5.63,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    img: "asset/newman's-own.png",
    weight: 500,
  ),
  GroceryModel(
    id: "4",
    name: "Seggiano Organic",
    price: 12.23,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    img: "asset/seggiano-organic.jpeg",
    weight: 100,
  ),
  GroceryModel(
    id: "5",
    name: "Spelt fusilli",
    price: 49.33,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    weight: 400,
    img: "asset/spelt-fusilli.png",
  ),
  GroceryModel(
    id: "6",
    name: "Rummo fusilli",
    price: 22.63,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    img: "asset/rummo-fusilli.png",
    weight: 200,
  ),
  GroceryModel(
    id: "7",
    name: "Newman's own",
    price: 5.63,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres Les « Fusilli » sont un format typique de l’Italie du sud, où ils sont connus dans chaque région sous un nom et une forme différente, selon les traditions culinaires locale",
    img: "asset/newman's-own.png",
    weight: 500,
  ),
  GroceryModel(
    id: "8",
    name: "Seggiano Organic",
    price: 12.23,
    desc:
        "Les pâtes sans gluten Rummo sont des pâtes étirées au bronze à base d'ingrédients sélectionnés tels que du riz complet, du maïs blanc cru, du maïs jaune - tous sans OGM. C'est le résultat d'une philosophie des pâtes et d'une cuisine particulière. Rummo Pasta est unique et facile à digérer, permettant ainsi l'incorporation naturelle de fibres",
    img: "asset/seggiano-organic.jpeg",
    weight: 100,
  ),
];
