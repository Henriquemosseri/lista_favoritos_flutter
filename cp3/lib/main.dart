import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Contatos Favoritos: ${contatosFav.length}"),
        ),
        body: ListView.builder(
           itemCount:contatos.length, itemBuilder: (context, index) {
            return ListTile(
              title: Text(contatos[index].nome),
              subtitle: Text(contatos[index].email),
            leading: CircleAvatar(backgroundImage: NetworkImage(contatos[index].foto, scale: 0.1), ),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border, color:contatosFav.contains(contatos[index])? Colors.red: Colors.black),
                onPressed: (){
                  setState(() {
                    favoritar(contatos[index]);
                  });
                }
                  
                
              ),
            );

          },
        ),
      ),
    );
  }
}

class Contato {
  Contato(this.nome, this.email, this.foto);
  String nome;
  String email;
  String foto;
}

List<Contato> contatos = [
  Contato(
    "Henrique Mosseri",
    "henriquemosseri@gmail.com",
    "https://upload.wikimedia.org/wikipedia/commons/9/93/Flamengo-RJ_%28BRA%29.png",
  ),
  Contato(
    "Patrick Mayer",
    "patrickmayer@gmail.com",
    "https://upload.wikimedia.org/wikipedia/commons/9/93/Flamengo-RJ_%28BRA%29.png",
  ),
  Contato(
    "Lilith Mosseri",
    "lilithMosseri@gmail.com",
    "https://upload.wikimedia.org/wikipedia/commons/9/93/Flamengo-RJ_%28BRA%29.png",
  ),
];
List<Contato> contatosFav=[

];
favoritar(Contato contato){
  if(contatosFav.contains(contato)){
    contatosFav.remove(contato);
  }  else{
    contatosFav.add(contato);
  }
}



