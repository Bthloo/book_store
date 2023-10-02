import 'dart:convert';
import 'dart:io';
import 'package:book_store/Features/Add%20to%20cart/Model/Add%20to%20Cart/AddToCartResponde.dart';
import 'package:book_store/Features/Add%20to%20cart/Model/Remove%20From%20Cart/RemoveFromCart.dart';
import 'package:book_store/Features/AddToWishlist/Model/AddToWishList.dart';
import 'package:book_store/Features/Auth/ViewModel/Login/login_cubit.dart';
import 'package:book_store/Features/Books%20Tab/Model/ProductsResponse.dart';
import 'package:book_store/Features/Books%20Tab/Model/Search%20Model/SearchResponse.dart';
import 'package:book_store/Features/Cart%20Tab/Models/Show%20Cart/ShowCartResponse.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/CheckOutResponse.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/Governrates/ShowGovernratesResponse.dart';
import 'package:book_store/Features/Check%20out%20Screem/Model/Place%20Order/PlaceorderResponse.dart';
import 'package:book_store/Features/Favirite%20tab/Model/Show%20Wishlist/ShowWishlistResponse.dart';
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
    var search = SearchResponse.fromJson(jsonDecode(request.body));
    return search;
  }



  static Future<AddToCartResponse> addToCart(int id) async {
    var uri = Uri.https(baseUrl, 'api/add-to-cart');
    var request = await http.post(uri,
      body: {
      'product_id' : '$id'
      },
      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var addToCart = AddToCartResponse.fromJson(jsonDecode(request.body));

    return addToCart;
  }

  static Future<AddToWishList> addToWishList(int id) async {
    var uri = Uri.https(baseUrl, 'api/add-to-wishlist');
    var request = await http.post(uri,
      body: {
        'product_id' : '$id'
      },
      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var addToWishList = AddToWishList.fromJson(jsonDecode(request.body));

    return addToWishList;
  }
  static Future<ShowCartResponse> showCart() async {
    var uri = Uri.https(baseUrl, 'api/cart');
    var request = await http.get(uri,

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var showCart = ShowCartResponse.fromJson(jsonDecode(request.body));

    return showCart;
  }
  static Future<RemoveFromCart> removeFromCart(int id) async {
    var uri = Uri.https(baseUrl, 'api/remove-from-cart');
    var request = await http.post(uri,
      body: {
      'cart_item_id' : '$id'
      },
      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var removeFromCart = RemoveFromCart.fromJson(jsonDecode(request.body));

    return removeFromCart;
  }


  static Future<ShowWishlistResponse> showWishlist() async {
    var uri = Uri.https(baseUrl, 'api/wishlist');
    var request = await http.get(uri,

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );

    var showWishlist = ShowWishlistResponse.fromJson(jsonDecode(request.body));

    return showWishlist;
  }

  static Future<CheckOutResponse> checkout() async {
    var uri = Uri.https(baseUrl, 'api/checkout');
    var request = await http.get(uri,

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var checkout = CheckOutResponse.fromJson(jsonDecode(request.body));

    return checkout;
  }

  static Future<ShowGovernoratesResponse> getGovernorate() async {
    var uri = Uri.https(baseUrl, 'api/governorates');
    var request = await http.get(uri,

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},

    );
    var getGovernorate = ShowGovernoratesResponse.fromJson(jsonDecode(request.body));

    return getGovernorate;
  }


  static Future<PlaceorderResponse> placeOrder({
    required String email,
    required String name,
    required String address,
    required String phone,
    required int cityId
  }) async {
    var uri = Uri.https(baseUrl, 'api/place-order');
    var request = await http.post(
      uri,
      body: {
        'email': email,
        'name': name,
        'address' : address,
        'governorate_id' : '$cityId',
        'phone' : phone
      },

      headers: {HttpHeaders.authorizationHeader: 'Bearer ${LoginCubit.userModel.data?.token}'},
    );

    var placeOrder = PlaceorderResponse.fromJson(jsonDecode(request.body));
    return placeOrder;
  }



}