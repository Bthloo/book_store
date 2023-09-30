import 'dart:convert';
import 'package:book_store/Features/Home%20Tab/Models/All%20Categories/AllCategoriesResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/Best%20Seller%20Model/BestSellerResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/New%20Arrival/NewArrivalResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/Slider%20Model/SliderResponse.dart';

import '../../Features/Auth/Models/Login Model/login_response.dart';
import 'package:http/http.dart' as http;

import '../../Features/Auth/Models/Register Model/respon.dart';

class ApiManager {
  static const String baseUrl = 'codingarabic.online';

  static Future<LoginResponse> login({
    required String email,
    required String password}) async {
    var uri = Uri.https(baseUrl, 'api/login');
    var request = await http.post(
        uri,
        body: {
          'email': email,
          'password': password
        }

      // headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    var loginResponse = LoginResponse.fromJson(jsonDecode(request.body));
    return loginResponse;
  }


  static Future<RegisterrResponse> register({
    required String email,
    required String password,
    required String name,
    required String passwordConfirmation
  }) async {
    var uri = Uri.https(baseUrl, 'api/register');
    var request = await http.post(
        uri,
        body: {
          'email': email,
          'password': password,
          'name': name,
          'password_confirmation': passwordConfirmation
        }

      // headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    var loginResponse = RegisterrResponse.fromJson(jsonDecode(request.body));
    return loginResponse;
  }



  static Future<LoginResponse> verifyEmail({
    required String verify}) async {
    var uri = Uri.https(baseUrl, 'api/verify-email');
    var request = await http.post(
        uri,
        body: {
          'verify_code': verify,
        }

      // headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    var loginResponse = LoginResponse.fromJson(jsonDecode(request.body));
    return loginResponse;
  }






  static Future<SliderResponse> getSlider() async {
    var uri = Uri.https(baseUrl, 'api/sliders');
    var request = await http.get(uri);

    var sliderResponse = SliderResponse.fromJson(jsonDecode(request.body));
    return sliderResponse;
  }




  static Future<BestSellerResponse> bestSeller() async {
    var uri = Uri.https(baseUrl, 'api/products-bestseller');
    var request = await http.get(uri);

    var bestSeller = BestSellerResponse.fromJson(jsonDecode(request.body));
    return bestSeller;
  }


  static Future<AllCategoriesResponse> allCategories() async {
    var uri = Uri.https(baseUrl, 'api/categories');
    var request = await http.get(uri);

    var allCategories = AllCategoriesResponse.fromJson(jsonDecode(request.body));
    return allCategories;
  }

  static Future<NewArrivalResponse> newArrival() async {
    var uri = Uri.https(baseUrl, 'api/products-new-arrivals');
    var request = await http.get(uri);

    var newArrival = NewArrivalResponse.fromJson(jsonDecode(request.body));
    return newArrival;
  }

}