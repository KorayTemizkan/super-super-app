import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] = 'dio/5.9.2';
    options.headers['Content-Type'] = 'application/json';

    print('İstek gönderiliyor: ${options.path}');

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Bir hata oluştu! Durum: ${err.response?.statusCode}, Mesaj: ${err.message}');
    return handler.next(err);
  }
}

/* Bu api şu an halka açık ama her ihtimale karşı ben böyle bir yapı kurdum

Eğer ileride bir değişiklik gerekirse sadece token alıp ekleyeceğiz
    
    ! Neon Academy dio alıştırmasından
    ? Tokenimizi tanımladık
    const String yourAuthToken = "insert your token here";
    ? Header'e token ekledik
    options.headers['Authorization'] = 'Bearer $yourAuthToken';

*/