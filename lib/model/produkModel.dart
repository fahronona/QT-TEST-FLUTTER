class ProdukModel {
  String? status;
  List<Data>? data;
  String error = "";

  ProdukModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ProdukModel({this.status, this.data});

  ProdukModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProdukModel{status: $status, data: $data, error: $error}';
  }
}

class Data {
  int? id;
  String? namaBarang;
  int? stok;
  int? jumlahTerjual;
  String? tanggalTransaksi;
  String? jenisBarang;

  Data(
      {this.id,
      this.namaBarang,
      this.stok,
      this.jumlahTerjual,
      this.tanggalTransaksi,
      this.jenisBarang});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBarang = json['nama_barang'];
    stok = json['stok'];
    jumlahTerjual = json['jumlah_terjual'];
    tanggalTransaksi = json['tanggal_transaksi'];
    jenisBarang = json['jenis_barang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_barang'] = this.namaBarang;
    data['stok'] = this.stok;
    data['jumlah_terjual'] = this.jumlahTerjual;
    data['tanggal_transaksi'] = this.tanggalTransaksi;
    data['jenis_barang'] = this.jenisBarang;
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, namaBarang: $namaBarang, stok: $stok, jumlahTerjual: $jumlahTerjual, tanggalTransaksi: $tanggalTransaksi, jenisBarang: $jenisBarang}';
  }
}
