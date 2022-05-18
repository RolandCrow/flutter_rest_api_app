

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_app/controller/framework_controller.dart';
import 'package:flutter_rest_api_app/model/framework.dart';
import 'package:flutter_rest_api_app/widget/evgen_button.dart';
import 'package:get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  final nameController = TextEditingController();
  final languageController = TextEditingController();

  final FrameworkController controller = FrameworkController.to;
  onItemPassed(FrameWork frameWork) {
      nameController.text = frameWork.name;
      languageController.text = frameWork.language;
  }

  onAddPressed() {
    FrameWork frameWork = FrameWork(
      name: nameController.text,
      language: languageController.text,
    );
    onClearPressed();
    controller.addFramework(frameWork);
  }

  onDeletePressed(String id) {
    onClearPressed();
    controller.deleteFramework(id);
  }

  onClearPressed() {
    nameController.clear();
    languageController.clear();
    controller.clearSelected();
  }

  onUpdatePressed(String id) {
    FrameWork frameWork = FrameWork(
      name: nameController.text,
      language: languageController.text
    );
    onClearPressed();
    controller.updateFramework(id, frameWork);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: const Text("REST API with dio")),
     body: Container(
       padding: const EdgeInsets.all(24),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children:  <Widget>[
             GetBuilder<FrameworkController>(
                builder: (controller) => Text(controller.selectedFrameWork == null
                            ? "" : controller.selectedFrameWork.objectId
                ),
             ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "name"),
                ),
                TextField(
                  controller: languageController,
                  decoration: const InputDecoration(hintText: "Language"),
                ),
             const SizedBox(height: 16,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 GetBuilder<FrameworkController>(builder: (controller) =>
                 EvgenButton(
                   onPressed: controller.selectedFrameWork == null
                   ? () => onAddPressed() : null,
                   text: 'Add',
                 )),
                 EvgenButton(
                   onPressed: controller.selectedFrameWork == null
                   ? null  : () => onUpdatePressed(controller.selectedFrameWork.objectId),
                   text: 'Update',
                 ),
                 EvgenButton(
                   onPressed: () => onClearPressed(),
                   text: "Clear",
                 ),
               ],
             ),
             const SizedBox(height: 16),
             GetBuilder<FrameworkController>(
                 builder: (controller) =>  Expanded(
                   child: ListView.separated(
                     itemBuilder: (context, index) => Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SizedBox(
                           width: 200,
                           child: InkWell(
                             onTap: () =>
                                 onItemPassed(controller.frameworks[index]),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 const SizedBox(height: 8),
                                 Text(controller.frameworks[index].name),
                                 const SizedBox(height: 4,),
                                 Text(controller.frameworks[index].language),
                                 const SizedBox(height: 8),
                               ],
                             ),
                           ),
                         ),
                         IconButton(
                           icon: const Icon(Icons.delete),
                             onPressed: () => onDeletePressed(
                               controller.frameworks[index].objectId)
                             ),
                       ],
                     ),
                     separatorBuilder: (context,index) =>
                     const Divider(color: Colors.black,),
                     itemCount: controller.frameworks.length,
                   ),
                 )
             )

           ],
         ),
       ),
     ),
   );
  }

}