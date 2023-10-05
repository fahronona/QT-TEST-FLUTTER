import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qt_test/model/produkModel.dart';
import 'package:qt_test/service/service.dart';

final produkDataProvider =
    FutureProvider.family<ProdukModel, String>((ref, produk) async {
  return ref.watch(produkProvider).getDataProduk(produk);
});

final proDatProvider =
    StateNotifierProvider<ProdukNotifier, FutureProvider<ProdukModel>>((ref) {
  return ProdukNotifier();
});

class ProdukNotifier extends StateNotifier<FutureProvider<ProdukModel>> {
  ProdukNotifier() : super(produkDataProvider(""));
}
