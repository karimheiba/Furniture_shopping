import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shopping_app/data/models/cart_model.dart';
import '../models/products_data_model.dart';
import '../models/user_data_model.dart';

abstract class RemoteDataSource {
  /// Auth Data Source
  Future<UserDataModel> createUser(String email, String password, String name);
  Future<UserCredential> logInUser(String email, String password);
  Future<void> logOut();

  /// User Data Source
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String userId);

  Future<void> updateFavorites(
    String userId,
    List<ProductDataModel> favorites,
  );
  Future<void> addProductsToCart(
    String userId,
    List<Map<String, dynamic>> cartProducts,
  );
  Future<void> updateCartProducts(
    String userId,
    List<Map<String, dynamic>> cartProducts,
  );

  /// Products Data Source
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts();
}

class RemoteDataSourceImp extends RemoteDataSource {
  RemoteDataSourceImp._();
  static final RemoteDataSourceImp instance = RemoteDataSourceImp._();

  final auth = FirebaseAuth.instance;

  @override
  Future<UserDataModel> createUser(
      String email, String password, String name) async {
    final newUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser.user!.displayName == null) {
      newUser.user!.updateDisplayName(name);
    }
    final UserDataModel user = UserDataModel(
        id: newUser.user!.uid,
        name: name,
        email: newUser.user!.email!,
        password: password,
        memberSince: newUser.user!.metadata.creationTime.toString(),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/e-commerce-dfc20.appspot.com/o/images%2Fusers%2Fdefault_user_image.jpg?alt=media&token=503f5a40-8633-4747-9f4f-16ad07174451');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(newUser.user!.uid)
        .set(
          user.toJson(),
        );

    return user;
  }

  @override
  Future<UserCredential> logInUser(String email, String password) async {
    final user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  /// User Data Source

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
      String userId) async {
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData;
  }

  @override
  Future<void> updateCartProducts(
      String userId, List<Map<String, dynamic>> cartProducts) async {
    final newCart = cartProducts.map((productMap) {
      final product = (productMap['product'] as ProductDataModel).toJson();
      final count = productMap['count'];
      return {
        'product': product,
        'count': count,
      };
    }).toList();
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'cartProducts': newCart,
    });
  }

  @override
  Future<void> updateFavorites(
      String userId, List<ProductDataModel> favorites) async {
    final newFavorites =
        favorites.map((productMap) => productMap.toJson()).toList();
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'favorites':  newFavorites,
    });
  }

  /// Products Data Source
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
    final products = FirebaseFirestore.instance.collection('products').get();
    return products;
  }

  @override
  Future<void> addProductsToCart(
      String userId, List<Map<String, dynamic>> cartProducts) async {
    final newCart = cartProducts.map((productMap) {
      final product = (productMap['product'] as ProductDataModel).toJson();
      final count = productMap['count'];
      return {
        'product': product,
        'count': count,
      };
    }).toList();
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'cartProducts': FieldValue.arrayUnion(newCart),
    });
  }

 
}
