import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shopping_app/data/models/products_data_model.dart';
import 'package:furniture_shopping_app/data/repositories/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepoImpl productsRepo;
  ProductsBloc({required this.productsRepo}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(ProductsLoading());
        final products = await productsRepo.getAllProducts();
        products.fold(
            (failure) => emit(ErrorProductsLoaded(message: failure.message)),
            (allProducts) => emit(ProductsLoaded(products: allProducts)));
      } else if (event is GetSearchProductsEvent) {
        final products = await productsRepo.getSearchProducts(
            productName: event.productName);
        products.fold(
            (failure) => emit(ErrorProductsLoaded(message: failure.message)),
            (searchedProducts) {
         // emit(const IsSearchedProductState(isSearched: true));
          emit(SearchedProductsLoaded(products: searchedProducts));
        });
      } else if (event is GetProductsInCategoryEvent) {
        emit(ProductsLoading());
        final products = await productsRepo.getProductsInCategory(
            categoryId: event.categoryId);

        products.fold(
            (failure) => emit(ErrorProductsLoaded(message: failure.message)),
            (searchedProducts) {
          emit(CategoryProductsLoaded(products: searchedProducts));
          print(searchedProducts);
        });
      } else if (event is StartSearchEvent) {
        emit(const IsSearchedProductState(isSearched: true));
      } else if (event is CloseSearchEvent) {
        emit(const IsSearchedProductState(isSearched: false));
      }
    });
  }
}
