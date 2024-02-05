import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseNotifier extends ChangeNotifier {
  List<dynamic> _data = [];

  List<dynamic> get data => _data;

  SupabaseNotifier() {
    fetchData();
  }

  Future fetchData() async {
    final response = await Supabase.instance.client.from('user_info').select();

    if (response.isNotEmpty) {
      _data = response;
      notifyListeners();
    } else {
      print('Error fetching data: ${response.toString()}');
    }
  }
}
