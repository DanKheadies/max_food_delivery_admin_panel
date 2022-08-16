import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? restaurantId;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;

  const Product({
    this.id,
    this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      restaurantId: snap['restaurantId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
        imageUrl,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #1',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      // quantity: 10,
      // isRecommended: true,
      // isPopular: false,
    ),
    Product(
      id: '2',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #2',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 2.99,
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      // quantity: 10,
      // isRecommended: false,
      // isPopular: true,
    ),
    Product(
      id: '3',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #1',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      // quantity: 10,
      // isRecommended: true,
      // isPopular: false,
    ),
    Product(
      id: '4',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #2',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 2.99,
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      // quantity: 10,
      // isRecommended: false,
      // isPopular: true,
    ),
    Product(
      id: '5',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #1',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      // quantity: 10,
      // isRecommended: true,
      // isPopular: false,
    ),
    Product(
      id: '6',
      restaurantId: 'aaaaaaaaaaaaaaaaa',
      name: 'Soft Drink #2',
      category: 'Drinks',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      price: 2.99,
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      // quantity: 10,
      // isRecommended: false,
      // isPopular: true,
    ),
  ];
}
