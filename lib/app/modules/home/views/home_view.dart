import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

import '../../../../src/user.pbgrpc.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test gRPC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => controller.insert(), child: const Text("d")),
          Obx(
            () => controller.count.value == false
                ? Expanded(
                    child: StreamBuilder<UserList>(
                      stream: ServerUserClient(controller.channel)
                          .list(
                            Empty(),
                            options:
                                CallOptions(compression: const GzipCodec()),
                          )
                          .asStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.listUser.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.listUser[index];
                              // return Text(snapshot.data!.listUser[index].name);
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(data.id.toString()),
                                ),
                                title: Text(data.name),
                                subtitle: Text(data.email),
                              );
                            },
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
