import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/view/aouth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../firebase/firebase_manager.dart';
import '../../../model/task_model.dart';
import '../../events/views/event_details.dart';
import '../widgets/custom_event_item.dart';

class LoveView extends StatelessWidget {
  const LoveView({super.key});
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextFormField(
              label: 'Search',
                prefixIcon: Icons.search,
                controller: searchController,
                validator: (value) {},
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                obscureText: false),
          ),
          SizedBox(
            height: 16,
          ),
          StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getFavorites(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong!"));
              }
              if (!snapshot.hasData || snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Padding(
                  padding:  EdgeInsets.only(top:height*.2 ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/fave0.png', height: 150, width: 150),
                    ],
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var taskModel = snapshot.data!.docs[index].data();

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetails(model: taskModel),
                          ),
                        );
                      },
                      child: CustomEventItem(
                        model: taskModel,
                        selectedIndex: index,
                      ),
                    );
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
