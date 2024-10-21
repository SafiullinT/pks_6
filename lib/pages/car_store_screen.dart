import 'package:flutter/material.dart';
import '../models/car.dart';
import 'add_car_screen.dart';
import '../components/car_card.dart';
import 'car_detail_screen.dart';

class CarStoreScreen extends StatefulWidget {
  final List<Car> cars;
  final Function addCar;
  final Function toggleFavorite;
  final Function addToCart;

  CarStoreScreen({
    required this.cars,
    required this.addCar,
    required this.toggleFavorite,
    required this.addToCart,
  });

  @override
  _CarStoreScreenState createState() => _CarStoreScreenState();
}

class _CarStoreScreenState extends State<CarStoreScreen> {
  void _deleteCar(Car car) {
    setState(() {
      widget.cars.remove(car);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Store'),
      ),
      body: widget.cars.isEmpty
          ? Center(child: Text('Нет автомобилей в магазине'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.cars.length,
        itemBuilder: (context, index) {
          final car = widget.cars[index];
          return CarCard(
            car: car,
            onDeleteCar: () => _deleteCar(car),
            onToggleFavorite: () => widget.toggleFavorite(car),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailScreen(
                    car: car,
                    onDeleteCar: () => _deleteCar(car),
                    addToCart: (car) => widget.addToCart(car),
                  ),
                ),
              );
            },
            onAddToCart: () => widget.addToCart(car),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarScreen(onAddCar: widget.addCar),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
