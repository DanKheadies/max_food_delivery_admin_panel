import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:max_food_delivery_admin_panel/models/models.dart';
import 'package:max_food_delivery_admin_panel/repositories/restaurant/base_restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addRestaurant(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .add(restaurant.toDocument());
  }

  @override
  Future<void> editProducts(List<Product> products) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('HfcneOR3g8Jpfrpdaj92')
        .update({
      'products': products.map((product) {
        return product.toDocument();
      }).toList()
    });
  }

  @override
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openingHours) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('HfcneOR3g8Jpfrpdaj92')
        .update({
      'openingHours': openingHours.map((openingHour) {
        return openingHour.toDocument();
      }).toList()
    });
  }

  @override
  Future<void> editRestaurantSettings(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('HfcneOR3g8Jpfrpdaj92')
        .update(restaurant.toDocument());
  }

  @override
  Stream<Restaurant> getRestaurant() {
    return _firebaseFirestore
        .collection('restaurants')
        .doc('HfcneOR3g8Jpfrpdaj92')
        .snapshots()
        .map((snapshot) {
      return Restaurant.fromSnapshot(snapshot);
    });
  }
}
