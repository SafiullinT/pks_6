import 'package:flutter/material.dart';
import 'pages/car_store_screen.dart';
import 'pages/add_car_screen.dart';
import 'pages/favorite_cars_screen.dart';
import 'pages/profile_screen.dart';
import 'models/car.dart';
import 'pages/cart_screen.dart';

void main() {
  runApp(CarStoreApp());
}

class CarStoreApp extends StatefulWidget {
  @override
  _CarStoreAppState createState() => _CarStoreAppState();
}

class _CarStoreAppState extends State<CarStoreApp> {
  int _currentIndex = 0;
  List<Car> cars = [
    Car(
      'Tesla Model S',
      'https://www.zr.ru/d/story/c4/924100/tesla-model-s-samyj-dalnobojnyj-elektromobil.jpg',
      79999,
      'Электрический седан с невероятным запасом хода и высокой производительностью.',
      '1020',
      '2.1',
      'Электрический',
      '322',
    ),
    Car(
      'BMW M5',
      'https://a.d-cd.net/ZwAAAgFaWeA-1920.jpg',
      100000,
      'Доработанная подразделением BMW Motorsport версия автомобиля BMW пятой серии. Первое поколение было представлено в 1986 году.',
      '727',
      '3',
      'Бензиновый',
      '350',
    ),
  ];

  List<Car> favoriteCars = [];
  List<Car> cart = []; // Добавляем корзину

  void addCar(Car newCar) {
    setState(() {
      addToCart(newCar); // Добавление нового автомобиля в корзину
    });
  }

  void toggleFavorite(Car car) {
    setState(() {
      if (favoriteCars.contains(car)) {
        favoriteCars.remove(car);
        car.isFavorite = false;
      } else {
        favoriteCars.add(car);
        car.isFavorite = true;
      }
    });
  }

  void addToCart(Car car) {
    setState(() {
      if (cart.contains(car)) {
        car.quantity++; // Увеличиваем количество, если товар уже в корзине
      } else {
        cart.add(car); // Добавляем товар в корзину
        car.quantity = 1; // Устанавливаем количество
      }
    });
  }

  void removeFromCart(Car car) {
    setState(() {
      cart.remove(car);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            CarStoreScreen(
              cars: cars,
              addCar: addCar,
              toggleFavorite: toggleFavorite, // Передаём toggleFavorite
              addToCart: addToCart, // Передаём addToCart для работы с корзиной
            ),
            CartScreen(cart: cart, removeFromCart: removeFromCart), // Передаём корзину
            FavoriteCarsScreen(
              favoriteCars: favoriteCars,
              onAddToCart: addToCart, // Передаём onAddToCart
            ),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white, // Устанавливаем белый фон для навигации
          selectedItemColor: Colors.black, // Чёрный цвет для выбранного элемента
          unselectedItemColor: Colors.black, // Чёрный цвет для невыбранных элементов
          showSelectedLabels: true, // Показываем текст для выбранных элементов
          showUnselectedLabels: true, // Показываем текст для невыбранных элементов
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Магазин'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Корзина'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
