import 'package:aplication/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage("Hola"),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  String titulo;
  
  MyHomePage(this.titulo);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController controllerUser;
  TextEditingController controllerPassword;

  List<User> usersSystem = [new User("Esteven32", "Esteven", "2342"), 
  new User("EvER54", "Ever", "4242"), new User("Juan21", "Juan", "password1234")];

  @override
  void initState() {
    super.initState();
    controllerUser = new TextEditingController();
    controllerPassword = new TextEditingController();
  }

  @override
    void dispose() {
      controllerPassword.dispose();
      controllerUser.dispose();
      super.dispose();
    }

  bool valiteUsers(List<User> listUsers){
    bool enter = false;
    listUsers.forEach((element) { 
      
      if(element.userName == controllerUser.text && element.password == controllerPassword.text){
        enter = true;
      }
    });
    return enter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://www.lwsc.com.zm/assets/admin/dist/img/user.png'),
                  ),
                  SizedBox(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Divider(
                    height: 15,
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      "Usuario: ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 25,
                        child: TextField(
                          controller: controllerUser,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Ingrese el usuario'),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      "Contraseña: ",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                        height: 25,
                        child: TextField(
                          obscureText: true,//para ocultar texto
                          controller: controllerPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Ingrese la contraseña'),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () => null, 
                    child: 
                      Icon(Icons.login, size:10)
                  ),

                  RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          size: 10,
                          color: Colors.white,
                        ),
                        Text(
                          "  Ingresar",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    color: Colors.green,
                    onPressed: (){
                      if(valiteUsers(usersSystem)){
                        Fluttertoast.showToast(
                        msg: "Found User!!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0
                        );
                      }
                      else{
                        Fluttertoast.showToast(
                        msg: "Error!!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                      }
                      },
                  ),
                  RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          "  Registrarse",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    color: Colors.blueAccent,
                    onPressed: () => print("ejecuta func de registrar"),
                  ),
                ],
              ),
            )
          ],
        ),
        
      ),
    );
  }
}