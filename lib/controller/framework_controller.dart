

import 'package:dio/dio.dart';
import 'package:flutter_rest_api_app/model/framework.dart';
import 'package:flutter_rest_api_app/repository/framework_repository.dart';
import 'package:get_state_manager/get_state_manager.dart';

class FrameworkController extends GetxController  {
      List<FrameWork> frameworks = [];
      FrameWork selectedFrameWork;
      FrameworkRepository repository = FrameworkRepository();

      static FrameworkController get to => Get.find<FrameworkController>();

      fetchAllFramework() async {
            frameworks = await repository.fetchAllFrameworks();
            update();
      }

      Future<FrameWork> fetchFramework(String id) async {
            return await repository.fetchFrameWork(id);
      }

      addFramework(FrameWork frameWork)  async {
           frameworks.add(await repository.addFramework(frameWork));
           update();
      }
      

      deleteFramework(String objectId) async {
            Response response = await repository.deleteFramework(objectId);
            if(response.data['code'] == null) {
                  frameworks.removeWhere((element) =>
                  element.objectId == objectId);
                  update();
            }

      }

      updateFramework(String objectId, FrameWork frameWork) async {
            Response response = await repository.updateFramework(objectId, frameWork);
            if(response.data['code'] == null) {
                 int index = frameworks.indexWhere((element) => element.objectId == objectId);
                 frameworks[index] = FrameWork.fromJson(response.data);
                  update();
            }
      }

      setSelected(FrameWork frameWork) {
            selectedFrameWork = frameWork;
            update();
      }

      clearSelected() {
            selectedFrameWork = null;
            update();

      }















}