import 'dart:convert';
import 'dart:io';
import 'package:book_store/Features/Auth/ViewModel/Login/login_cubit.dart';
import 'package:book_store/Features/Books%20Tab/Model/ProductsResponse.dart';
import 'package:book_store/Features/Books%20Tab/Model/Search%20Model/SearchResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/All%20Categories/AllCategoriesResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/Best%20Seller%20Model/BestSellerResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/New%20Arrival/NewArrivalResponse.dart';
import 'package:book_store/Features/Home%20Tab/Models/Slider%20Model/SliderResponse.dart';
import 'package:book_store/Features/Profile%20tab/Model/ProfileResponse.dart';
import 'package:book_store/Features/Profile%20tab/Model/Update%20Model/UpdateResponse.dart';

import '../../Features/Auth/Models/Login Model/LoginResponse.dart';
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



  static Future<ProfileResponse> profile() async {
    var uri = Uri.https(baseUrl, 'api/profile');
    var request = await http.get(
        uri,
      headers: {HttpHeaders.authorizationHeader:
      'Bearer ${LoginCubit.userModel.data?.token}'
      },
    );

    var profileResponse = ProfileResponse.fromJson(jsonDecode(request.body));
    return profileResponse;
  }



  static Future<UpdateResponse> update({
    required String email,
    required String name,
    required String address,
    required String phone,
    required String city
  }) async {
    var uri = Uri.https(baseUrl, 'api/update-profile');
    var request = await http.post(
        uri,
        body: {
          'email': email,
          'name': name,
         'address' : address,
          'city' : city,
          'phone' : phone
        },

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},
    );

    var update = UpdateResponse.fromJson(jsonDecode(request.body));
    return update;
  }



  static Future<ProductsResponse> products({required int page}) async {
    var uri = Uri.https(baseUrl, 'api/products');
    var request = await http.get(uri);

    var products = ProductsResponse.fromJson(jsonDecode(request.body));

    return products;
  }

  static Future<SearchResponse> search({required String keyWord}) async {
    Map<String, String> queryParams = {
      'name': keyWord,
    };
    var uri = Uri.https(baseUrl, 'api/products-search',queryParams);
    var request = await http.get(uri);
    print(request.body);
    var search = SearchResponse.fromJson(jsonDecode(request.body));
    print(search.message??'lll');
    return search;
  }

}