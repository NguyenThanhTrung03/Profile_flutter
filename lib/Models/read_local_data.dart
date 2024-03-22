import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:unit_test/Models/district.dart';
import 'package:unit_test/Models/province.dart';
import 'package:unit_test/Models/ward.dart';

class ReadLocationData {
  List<Province> provincelist = [];
  List<District> districtlist = [];
  List<Ward> wardList = [];

  Future<void> loadLocationData() async {
    try {
// Tải nội dung của tệp JSON từ assets
      String data =
          await rootBundle.loadString('assets/don_vi_hanh_chinh.json');
// Chuyển đổi chuỗi JSON thành một đối tượng có kiểu dữ liệu từ điển
      Map<String, dynamic> jsonData = json.decode(data);
// Trích xuất danh sách các tỉnh từ dữ liệu từ điển và chuyển đổi thành // danh sách các đối tượng Province
      List provinceData = jsonData['province'];
      provincelist =
          provinceData.map((json) => Province.fromMap(json)).toList();
// Trích xuất danh sách các quận từ dữ liệu từ điến và chuyến đối thành // danh sách các đối tượng District
      List districtData = jsonData['district'];
      districtlist =
          districtData.map((json) => District.fromMap(json)).toList();
// Trích xuất danh sách các xã từ dữ liệu từ điến và chuyển đối thành // danh sách các đối tượng Ward
      List wardData = jsonData['ward'];
      wardList = wardData.map((json) => Ward.fromMap(json)).toList();
      
    } catch (e) {
// Ghi log ra màn hình debug nếu có lỗi ngoại lệ xảy ra
      debugPrint('Error loading location data: $e');
    }
  }
}

ReadLocationData readLocationData = ReadLocationData();
