import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  String _currentAddress = '';

  String get currentAddress => _currentAddress;

  Position? get currentPosition => _currentPosition;

  Future<dynamic> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화되어 있다면 사용자에게 활성화 요청
      return Future.error('위치 서비스를 켜 주세요.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부되었다면 에러 반환
        return Future.error('위치 서비스 활성화 요청이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부되었다면 에러 반환
      return Future.error(
          '위치 서비스 활성화 요청이 완전히 거부되어 더 이상 진행할 수 없습니다. 디바이스 설정 창에서 직접 켜 주세요.');
    }

    // 현재 위치 정보 가져오기
    Position position = await Geolocator.getCurrentPosition();
    _currentPosition = position;

    // 가져온 위치 정보를 기반으로 주소 조회
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      _currentAddress =
          "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
    } else {
      _currentAddress = "No address available";
    }

    notifyListeners(); // 위치 정보 업데이트 알림
  }
}
