import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qt_test/misc/constant.dart';
import 'package:qt_test/model/produkModel.dart';
import 'package:http/http.dart' as http;

class ServiceData {
  Future<ProdukModel> getDataProduk(String namaBarang) async {
    try {
      final response = await http.post(Uri.parse("$urlString/barang"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{"nama_barang": namaBarang}));

      print(jsonDecode(response.body));
      return ProdukModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      return ProdukModel.withError(e.toString());
    }
  }

  Future<String> deleteProduk(String id) async {
    try {
      final response = await http.delete(Uri.parse("$urlString/barang/$id"));
      var data = jsonDecode(response.body);

      getDataProduk("");
      return data["message"];
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> createData(
      {required String namaBarang,
      required String stok,
      required String jumlah_terjual,
      required String tanggal_transaksi,
      required String jenisBarang}) async {
    try {
      final response = await http.post(Uri.parse("$urlString/createBarang"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "nama_barang": namaBarang,
            "stok": stok,
            "jumlah_terjual": jumlah_terjual,
            "tanggal_transaksi": tanggal_transaksi,
            "jenis_barang": jenisBarang,
          }));
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> updateData(
      {required String idBarng,
      required String namaBarang,
      required String stok,
      required String jumlah_terjual,
      required String tanggal_transaksi,
      required String jenisBarang}) async {
    try {
      final response = await http.put(Uri.parse("$urlString/barang/$idBarng"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "nama_barang": namaBarang,
            "stok": stok,
            "jumlah_terjual": jumlah_terjual,
            "tanggal_transaksi": tanggal_transaksi,
            "jenis_barang": jenisBarang,
          }));

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}

final produkProvider = Provider<ServiceData>((ref) => ServiceData());
