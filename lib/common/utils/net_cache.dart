import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_news/common/utils/storage.dart';
import 'package:flutter_news/common/values/values.dart';

class CacheObject {
  Response response;
  int timeStamp;
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    // TODO: implement onRequest
    super.onRequest(options);
    if (!CACHE_ENABLE) return options;

    // 是否下拉刷新
    bool refresh = options.extra["refresh"] == true;

    // 是否磁盘缓存
    bool cacheDisk = options.extra["cacheDisk"] == true;

    if (refresh) {
      if (options.extra["list"] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        delete(options.uri.toString());
      }

      if (cacheDisk) {
        await StorageUtil().remove(options.uri.toString());
      }

      return options;
    }

    // get请求，开启缓存
    if (options.extra['noCache'] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();

      var ob = cache[key];
      if (ob != null) {
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          return cache[key].response;
        } else {
          cache.remove(key);
        }
      }

      if (cacheDisk) {
        var cacheData = StorageUtil().getJSON(key);
        if (cacheData != null) {
          return Response(statusCode: 200, data: cacheData);
        }
      }
    }
  }

  @override
  onError(DioError err) async {
    // 错误状态不缓存
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    if (CACHE_ENABLE) {
      return _saveCache(response);
    }
  }

  Future<void> _saveCache(Response object) async {
    RequestOptions options = object.request;

    // 只缓存 get 的请求
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      // 策略：内存、磁盘都写缓存

      // 缓存key
      String key = options.extra["cacheKey"] ?? options.uri.toString();

      // 磁盘缓存
      if (options.extra["cacheDisk"] == true) {
        await StorageUtil().setJSON(key, object.data);
      }

      // 内存缓存
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == CACHE_MAXCOUNT) {
        cache.remove(cache[cache.keys.first]);
      }

      cache[key] = CacheObject(object);
    }
  }
  
  void delete(String key) {
    cache.remove(key);
  }
}
