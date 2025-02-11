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
          StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseManager.getFavorites(),
            builder: (context, snapshot) {
              return Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventDetails(
                                    model:
                                    snapshot.data!.docs[index].data(),
                                  )));
                        },
                        child: CustomEventItem(
                          model: snapshot.data!.docs[index].data(),
                          selectedIndex: index,
                        ),
                      ),
                      itemCount: snapshot.data?.docs.length ?? 0));
            },
          ),
        ],
      ),
    );
  }
}
