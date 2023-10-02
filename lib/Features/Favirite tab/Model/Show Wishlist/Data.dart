import 'ProductData.dart';
import 'Links.dart';

/// current_page : 1
/// product_data : [{"id":1,"name":"Grokking Algorithms","price":"250.00","category":"Software","image":"https://codingarabic.online/storage/product/UXbY3BvoHIQCuG6DqBK1dtfSKnpH67tUjwdr6ctT.png","discount":50,"stock":96,"description":"<p>Grokking Algorithms is a fully illustrated, friendly guide that teaches you how to apply common algorithms to the practical problems you face every day as a programmer. You’ll start with sorting and searching and, as you build up your skills in thinking algorithmically, you’ll tackle more complex concerns such as data compression and artificial intelligence. Each carefully presented example includes helpful diagrams and fully annotated code samples in Python. Learning about algorithms doesn’t have to be boring! Get a sneak peek at the fun, illustrated, and friendly examples you’ll find in Grokking Algorithms on Manning Publications’ YouTube channel. Continue your journey into the world of algorithms with Algorithms in Motion, a practical, hands-on video course available exclusively at Manning.com (www.manning.com/livevideo/algorithms-​in-motion).</p>","best_seller":4},{"id":3,"name":"Cracking the Coding Interview","price":"399.00","category":"Software","image":"https://codingarabic.online/storage/product/g1187MzWBCj9Zlcd4Q4jxty4tLPOAohmx7FYeyPh.jpg","discount":30,"stock":81,"description":"<p>I am not a recruiter. I am a software engineer. And as such, I know what it’s like to be asked to whip up brilliant algorithms on the spot and then write flawless code on a whiteboard. I’ve been through this as a candidate and as an interviewer. Cracking the Coding Interview, 6th Edition is here to help you through this process, teaching you what you need to know and enabling you to perform at your very best. I’ve coached and interviewed hundreds of software engineers. The result is this book. Learn how to uncover the hints and hidden details in a question, discover how to break down a problem into manageable chunks, develop techniques to unstick yourself when stuck, learn (or re-learn) core computer science concepts, and practice on 189 interview questions and solutions.</p>","best_seller":19}]
/// first_page_url : "https://codingarabic.online/api/wishlist?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://codingarabic.online/api/wishlist?page=1"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://codingarabic.online/api/wishlist?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}]
/// next_page_url : null
/// path : "https://codingarabic.online/api/wishlist"
/// per_page : 15
/// prev_page_url : null
/// to : 2
/// total : 2

class Data {
  Data({
      this.currentPage, 
      this.productData, 
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  Data.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      productData = [];
      json['data'].forEach((v) {
        productData?.add(ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<ProductData>? productData;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (productData != null) {
      map['data'] = productData?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}