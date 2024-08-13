import 'package:adv_getx/Model/Modal.dart';
import 'package:adv_getx/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CrudController userController = Get.put(CrudController());

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(centerTitle: true,title: Text(' User data'),),
      body: Obx(
            () => ListView.builder(
          itemBuilder: (context, index) => Card(
            color: Colors.blueAccent.shade100,
            child: ListTile(
              leading: Text(
                '${userController.userList[index].id}',
                style: TextStyle(fontSize: 20),
              ),
              title: Text(
                '${userController.userList[index].name}',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('${userController.userList[index].degingatiom}'),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        userController.ubdateuser(index);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Update User'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: userController.txtid,
                                  decoration: InputDecoration(
                                      hintText: ' id'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: userController.txtname,
                                  decoration: InputDecoration(
                                      hintText: ' name'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: userController.txtde,
                                  decoration: InputDecoration(
                                      hintText: ' designation'),
                                ),
                              ],
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancle'),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  userController.saveData(index);

                                  userController.txtname.clear();
                                  userController.txtid.clear();
                                  userController.txtde.clear();

                                },
                                child: Text('Save'),
                              )
                            ],
                          ),
                        );

                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        userController.removeuser(index);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
          itemCount: userController.userList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add User'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: userController.txtid,
                    decoration: InputDecoration(hintText: ' id'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.txtname,
                    decoration: InputDecoration(hintText: ' name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: userController.txtde,
                    decoration: InputDecoration(hintText: ' designnation'),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancle'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    CrudModel user = CrudModel(
                        int.parse(userController.txtid.text),
                        userController.txtname.text,
                        userController.txtde.text);
                    userController.adduser(user);


                    userController.txtname.clear();
                    userController.txtid.clear();
                    userController.txtde.clear();
                  },
                  child: Text('Save'),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

