import 'package:flutter/material.dart';
import '../models/car.dart';

class FavoriteCarsScreen extends StatelessWidget {
  final List<Car> favoriteCars;
  final Function(Car) onAddToCart;

  FavoriteCarsScreen({required this.favoriteCars, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранные автомобили'),
      ),
      body: favoriteCars.isEmpty
          ? Center(
        child: Text(
          'У вас нет избранных автомобилей',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: favoriteCars.length,
        itemBuilder: (context, index) {
          final car = favoriteCars[index];
          return ListTile(
            leading: Image.network(car.imageUrl),
            title: Text(car.name),
            subtitle: Text('${car.price} USD'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => onAddToCart(car),
            ),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
