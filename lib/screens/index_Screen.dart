import 'package:flutter/material.dart';


class IndexScreen extends StatefulWidget {
  const IndexScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  String _orderSelected="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 90,
        elevation: 5,
        title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
          Text("Anuncio",style: TextStyle(fontSize: 20,color:Colors.grey),)
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Row(children: [
              DropdownButton(
                items: <String>["By date","by_creation"]
                  .map((i) => DropdownMenuItem<String>(
                    child:Text(i,style: const TextStyle(color: Colors.deepPurple),),
                    value: i,
              )).toList(),
              hint: 
                _orderSelected =="" ? const Text("Seleccionar",style:TextStyle(color: Colors.white),) : Text(_orderSelected,style: TextStyle(color: Colors.white),) ,
              onChanged: (value){
                setState(() {
                  _orderSelected=value.toString();
                });              
              }),
              const _UserAvatar()
            ],),
          )
        ],
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius:18,
          child:ClipOval(child:Image.network("assets/images/user.png"),), 
        ),
      ),
      onTap: (){
        showDialog(
          context: context, 
          builder: (context){ return _ProfileDialog();
          });
      },
    );
  }
}
class _ProfileDialog extends StatelessWidget {
  final _nameController=TextEditingController();
  final _avatarController=TextEditingController();
  _ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .3,
        height: MediaQuery.of(context).size.height * .3 ,
        child: Form(
          
          child:SingleChildScrollView(
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:18,
                    child:ClipOval(child:Image.network("assets/images/user.png"),), 
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder()),
                  controller: _nameController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "s", border: OutlineInputBorder()
                  ),
                  controller: _avatarController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple
                  ),
                  onPressed: (){
                    print("fd");
                }, child: const Text("Actualizar"))
              ],),
          ))
        ,

      ),
    );
  }
}