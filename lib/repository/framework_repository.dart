
import 'package:dio/dio.dart';
import 'package:flutter_rest_api_app/model/framework.dart';

import '../api/client.dart';
import '../api/framework_api.dart';

class FrameworkRepository {

  Dio apiClient;

  FrameworkRepository() {
    apiClient = client();
  }

  Future<List<FrameWork>> fetchAllFrameworks() async {
    Response response = await fetchAll(apiClient);
    return List<FrameWork>.from(
        (response.data).map((json) => FrameWork.fromJson(json)));
  }

  Future<FrameWork> fetchFrameWork(String objectId) async {
    Response response = await fetch(apiClient, objectId);
    return FrameWork.fromJson(response.data);
  }


  Future<FrameWork> addFramework(FrameWork frameWork) async {
    Response response = await add(apiClient, frameWork.toJson());
        return FrameWork.fromJson(response.data);
  }

  Future<Response> deleteFramework(String objectId) async {
      return await delete(apiClient, objectId,);
  }

  Future<Response> updateFramework(String objectId, FrameWork frameWork ) async{
    return await update(apiClient, objectId, frameWork.toJson());
  }






}