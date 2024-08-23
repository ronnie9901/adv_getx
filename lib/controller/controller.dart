import 'package:adv_getx/Model/Modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CrudController extends GetxController {
  RxList<CrudModel> userList = <CrudModel>[].obs;

  var txtid = TextEditingController();
  var txtname = TextEditingController();
  var txtde = TextEditingController();

  void adduser(CrudModel user) {
    userList.add(user);
  }

  void removeuser(int index) {
    userList.removeAt(index);
  }

  // void ubdateuser(int index) {
  //   txtid = TextEditingController(text: userList[index].id.toString());
  //   txtname = TextEditingController(text: userList[index].name);
  //   txtde = TextEditingController(text: userList[index].degingatiom);
  // }
  void saveData(int index)
  {
    userList[index].id = int.parse(txtid.text);
    userList[index].name = txtname.text;
    userList[index].degingatiom= txtde.text;
    userList.refresh();
  }

}
