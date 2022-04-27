import 'package:flutter/material.dart';

class WorkflowsList extends StatelessWidget {
  const WorkflowsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWorkflowsList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int idx) {
                var workflows = snapshot.data.list[idx];
                return ListTile(
                  leading: Text('${idx + 1}'),
                  title: Text('${workflows.name}'),
                  subtitle: Text('${workflows.description}'),
                  trailing: Text('${workflows.id}'),
                  onTap: () {},
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
