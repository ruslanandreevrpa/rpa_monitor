import 'package:flutter/material.dart';

class WorkflowLaunchesList extends StatelessWidget {
  const WorkflowLaunchesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getWorkflowLaunches('624eaeaaba0a1f33dcfe499b'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.list.length,
              itemBuilder: (BuildContext context, int idx) {
                var workflow = snapshot.data.list[idx];
                return ListTile(
                  leading: Text('${idx + 1}'),
                  title: Text('${workflow.id}'),
                  subtitle: Text('${workflow.type}'),
                  trailing: Text('${workflow.status}'),
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
