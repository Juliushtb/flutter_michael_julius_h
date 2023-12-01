import 'package:flutter/material.dart';
import 'package:prioritas_1/service/services.dart';

class DiceBearProvider extends ChangeNotifier {
  String _avatarUrl = '';
  final ApiService _apiService = ApiService();

  String get avatarUrl => _avatarUrl;

  Future<void> fetchAvatar() async {
    try {
      final svgString = await _apiService.fetchAvatar();
      _avatarUrl = svgString;
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
