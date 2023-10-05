import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qt_test/model/produkModel.dart';
import 'package:qt_test/service/service.dart';

var produkProvider = Provider<ServiceData>((ref) => ServiceData());

final produkDataProvider =
    FutureProvider.family<ProdukModel, String>((ref, produk) async {
  return ref.watch(produkProvider).getDataProduk(produk);
});

final streamProdukProvider = StreamProvider.family<ProdukModel, String>(
    (ref, produk) => ref.watch(produkProvider).getDataStream(""));

final stateString = StateProvider<String>((ref) => "");
