import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:max_food_delivery_admin_panel/models/models.dart';

class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final List<String>? tags;
  final List<Category>? categories;
  final List<Product>? products;
  final List<OpeningHours>? openingHours;

  const Restaurant({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.tags,
    this.categories,
    this.products,
    this.openingHours,
  });

  // @override
  // List<Object?> get props => [
  //       id,
  //       name,
  //       imageUrl,
  //       description,
  //       tags,
  //       categories,
  //       products,
  //       openingHours,
  //     ];

  @override
  List<Object?> get props {
    return [
      id,
      name,
      imageUrl,
      description,
      tags,
      categories,
      products,
      openingHours,
    ];
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,
    List<String>? tags,
    List<Category>? categories,
    List<Product>? products,
    List<OpeningHours>? openingHours,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      'imageUrl': imageUrl ?? '',
      'description': description ?? '',
      'tags': tags ?? [],
      'categories': categories!.map(
        (category) {
          return category.toDocument();
        },
      ).toList(),
      'products': products!.map(
        (product) {
          return product.toDocument();
        },
      ).toList(),
      'openingHours': openingHours!.map(
        (openingHours) {
          return openingHours.toDocument();
        },
      ).toList(),
    };
  }

  String toJson() => json.encode(toDocument());

  factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
    return Restaurant(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List).map(
        (tag) {
          return tag as String;
        },
      ).toList(),
      categories: (snap['categories'] as List).map(
        (category) {
          return Category.fromSnapshot(category);
        },
      ).toList(),
      products: (snap['products'] as List).map(
        (product) {
          return Product.fromSnapshot(product);
        },
      ).toList(),
      openingHours: (snap['openingHours'] as List).map(
        (openingHour) {
          return OpeningHours.fromSnapshot(openingHour);
        },
      ).toList(),
    );
  }

  static List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://holisticgaming.com/static/media/terraria.3233a77fadd0c6f979f3.jpg',
      description: 'This is good place.',
      tags: const [
        'italian',
        'desserts',
      ],
      categories: Category.categories,
      products: Product.products,
      openingHours: OpeningHours.openingHoursList,
    ),
  ];
}
