import 'package:dio/dio.dart';
import 'dart:io';
import '../config/service_url.dart';
import 'dart:async';

const httpHeader = {
  "referer": 'https://c.y.qq.com/',
};

// 获取首页轮播
Future getHomePageCarousel() async {
  print('开始获取首页轮播');
  try {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(servicePath['homePageCarousel']);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print(e);
  }
}

// 获取歌单列表
Future getHomePageMusicList() async {
  print('开始获取歌单列表');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeader;
    response = await dio.get(servicePath['getHomeMusicList'],
        queryParameters: {"sin": 0, "ein": 59});
    print('>>>>>>>data:${response.data}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print(e);
  }
}

// 获取数据公共方法post
Future request(url, {reqdata}) async {
  print('开始获取数据');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeader;
    if (reqdata == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: reqdata);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print(e);
  }
}

// 获取数据公共方法get
Future getrequest(url, {reqdata}) async {
  print('开始获取数据');
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = httpHeader;
    if (reqdata == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url], queryParameters: reqdata);
    }
    if (response.statusCode == 200) {
      print('get>>>>>>>data:${response.data}');
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print(e);
  }
}
