class Car {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final String horsepower;
  final String acceleration;
  final String engineType;
  final String maxSpeed;
  bool isFavorite;
  int quantity;  // Добавляем количество

  Car(
      this.name,
      this.imageUrl,
      this.price,
      this.description,
      this.horsepower,
      this.acceleration,
      this.engineType,
      this.maxSpeed, {
        this.isFavorite = false,
        this.quantity = 0,  // Устанавливаем начальное количество
      });
}
