class FoodItem {
  final String name;
  final String asset;

  FoodItem(this.name, this.asset);
}

class Data {
  static final FoodItems = <FoodItem>{
    FoodItem('Crispy Pack', 'crispy_pack.jpeg'),
    FoodItem('Eggplant Pizza', 'eggplant.jpeg'),
    FoodItem('Funghi Pizza', 'funghi.jpeg'),
    FoodItem('Ham Pizza', 'ham.jpeg'),
    FoodItem('Little Ones', 'kids_peas.jpeg'),
    FoodItem('Tomato Pizza', 'tomato.jpeg'),
  };
}
