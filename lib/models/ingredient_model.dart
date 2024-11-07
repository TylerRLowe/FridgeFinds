class IngredientModel {
  int id = -1;
  double quantity = -1;
  Map<String, dynamic> nutrition = {};
  DateTime expiryDate = DateTime(0);
  IngredientModel();
  IngredientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    nutrition = json['nutrition'];
    expiryDate =DateTime.parse(json['expiry_date']);
  }
}