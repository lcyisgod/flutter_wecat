import 'package:dio/dio.dart';

class Method {
  const Method._();
  static String put = 'PUT';
  static String get = "GET";
  static String post = 'POST';
  static String delete = 'DELETE';
}

class DioUtil {
  static Dio? _dio;
  static final DioUtil _instance = DioUtil._init();

  ///请求基础信息设置
  static BaseOptions getDefaultOptions() {
    final BaseOptions options = BaseOptions();
    options.baseUrl = "";

    ///超时时间
    options.connectTimeout = Duration(seconds: 5);
    options.receiveTimeout = Duration(seconds: 5);

    return options;
  }


  ///初始化网络请求实例
  DioUtil._init() {
    _dio = Dio();
  }

  factory DioUtil() {
    return _instance;
  }

  ///发起Get请求
  Future<void> get(String path,
      {Map<String, dynamic>? pathParams, dynamic data, Function? successCallBack, Function? errorCallBack}) async{
    return request(
        path,
        data: data,
        method: Method.get,
        pathParams: pathParams,
        successCallback: successCallBack,
        errorCallback: errorCallBack);
  }

  Future<void> request(String path,
      {required String method, Map<String, dynamic>? pathParams, dynamic data, Function? successCallback, Function? errorCallback}) async{
    return requestLocalService(
        path,
        data: data,
        method: method,
        pathParams: pathParams,
        successCallback: successCallback,
        errorCallback: errorCallback
    );
  }

  ///请求本服务器数据
  Future<void> requestLocalService(String path,
      {
        required String method,
        Map<String, dynamic>? pathParams,
        dynamic data,
        Function? successCallback,
        Function? errorCallback}) async {
    Map<String, dynamic> dataMap = <String, dynamic>{};
    if (data != null) {
      if (data.runtimeType == FormData) {
        dataMap.addAll({
          'data':data.toString()
        });
      }else {
        dataMap.addAll({
          'data':data
        });
      }
    }

    if (pathParams != null) {
      dataMap.addAll({
        'pathParams':pathParams
      });
    }

    try {
      Response<dynamic> response = await _dio!.request<dynamic>(
          path,
          data: data,
          queryParameters: pathParams,
          options: Options(method: method)
      );

      if (response.statusCode == 200) {
        successCallback?.call(response.data.toString());
      } else {
        errorCallback?.call(_handleHttpError(response.statusCode));
      }
    } catch (e) {
      print(e);
    }
  }

  ///处理Http错误码
  Map<String,String> _handleHttpError(int? errorCode) {
    if (errorCode == 404) {
      return {
        'errorCode':errorCode.toString(),
        'errorMsg':'无效的请求'
      };
    } else if (errorCode == 900) {
      return {
        'errorCode':errorCode.toString(),
        'errorMsg':'网络不给力'
      };
    } else {
      return {
        'errorCode':errorCode.toString(),
        'errorMsg':'未知错误,请联系客服'
      };
    }
  }
}