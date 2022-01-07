import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key ? key
  }): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State < HomePage > {
  List title = [];
  List date = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do list', style: TextStyle(
          fontSize: 30
        ), ), centerTitle: true,
      ),
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: title.length == 0 ? Center(child: Text('You have not any task'), ) : ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text(title[index]),
                    subtitle: Text(date[index]),
                    trailing: IconButton(onPressed: (){

                      title.removeAt(index);
                      date.removeAt(index);
                      setState(() {
                        
                      });
                    }, icon: Icon(Icons.delete)),
                  ),
                ),
              ],
            );
          },
          itemCount: title.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: Text('Add your Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add Your Title'),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      hintText: 'hobe kichu akta',
                    ),
                  ),
                  SizedBox(height: 15, ),
                  Text('Add Your Date'),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      hintText: 'dd/mm/yr'
                    ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
              actions: [
                TextButton(onPressed: (){
                  titleController.clear();
                  dateController.clear();
                  Navigator.pop(context);

                }, child: Text('Clear')
                ),
                TextButton(onPressed: (){
                    title.add(titleController.text);
                    date.add(dateController.text);
                    titleController.clear();
                    dateController.clear();
                    Navigator.pop(context);
                    setState(() {});
                }, child: Text('Add'))
              ],
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}