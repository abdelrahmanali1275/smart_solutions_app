import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/api/api_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  /// تسجيل الدخول
  void login(String email, String password, bool rememberMe) async {
    emit(AuthLoading());
    try {
      final response = await ApiService().post('/client/login', {
        'email': email,
        'password': password,
      });

      if (response.data?['token'] != null && response.data?['data'] != null) {
        final prefs = await SharedPreferences.getInstance();

        // حفظ التوكن والدور
        final userData = response.data['data'];
        final token = response.data['token'];
        final role = userData['role'] ?? 'unknown'; // توفير قيمة افتراضية

        await prefs.setString('token', token);
        await prefs.setString('role', role);
        await prefs.setString('userData', jsonEncode(userData));

        if (rememberMe) {
          await prefs.setString('email', email);
          await prefs.setString('password', password);
        }

        emit(AuthSuccess(role));
      } else {
        throw Exception('Invalid login response');
      }
    } catch (e) {
      emit(AuthFailure('Login failed: ${e.toString()}'));
    }
  }

  /// إرسال رابط إعادة تعيين كلمة المرور
  void sendPasswordReset(String email) async {
    if (email.isEmpty || !email.contains('@')) {
      emit(AuthFailure('Please provide a valid email address'));
      return;
    }

    emit(AuthLoading());
    try {
      await ApiService().post('/client/password/email', {'email': email});
      emit(AuthSuccess('reset')); // تحديد حالة النجاح لإعادة تعيين كلمة المرور
      print('Password reset email sent successfully');
    } on DioError catch (dioError) {
      emit(AuthFailure(
          dioError.response?.data['message'] ?? 'Failed to send reset email'));
    } catch (e) {
      emit(AuthFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }

  /// تسجيل الخروج
  void logout() async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // حذف جميع البيانات
      emit(AuthInitial());
      print('User logged out successfully');
    } catch (e) {
      emit(AuthFailure('Failed to log out: ${e.toString()}'));
    }
  }

  /// التحقق من تسجيل الدخول عند بدء التطبيق
  void checkIfLoggedIn() async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final role = prefs.getString('role') ?? 'unknown'; // توفير قيمة افتراضية

      if (token != null) {
        emit(AuthSuccess(role));
        print('User is already logged in with role: $role');
      } else {
        emit(AuthInitial());
        print('User is not logged in');
      }
    } catch (e) {
      emit(AuthFailure('Failed to check login status: ${e.toString()}'));
    }
  }
}
