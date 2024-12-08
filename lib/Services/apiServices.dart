import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) => ApiService(Dio()));

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<dynamic>> fetchUser(String email) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
      queryParameters: {'email': email},
    );
    return response.data;
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    await dio.post(
      'https://jsonplaceholder.typicode.com/users',
      data: data,
    );
  }

  Future<void> verifyOTP(Map<String, dynamic> data) async {
    await dio.post(
      'https://jsonplaceholder.typicode.com/users',
      data: data,
    );
  }
}
