import 'package:crud_firebase/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Para manejar autenticación
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Verificar el estado de autenticación del usuario
  User? user;

  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  // Método para verificar si el usuario está logueado
  void checkUserAuthentication() {
    final currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      user = currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text(
          'Venta de Autos Online',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          // Si el usuario está logueado, mostrar "Bienvenido"
          user == null
              ? TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    // Acciones cuando el usuario está logueado, como cerrar sesión
                    FirebaseAuth.instance.signOut().then((value) {
                      setState(() {
                        user = null; // Actualiza el estado a "no autenticado"
                      });
                    });
                  },
                  child: Text(
                    "Bienvenido, ${user?.displayName ?? user?.email?.split('@')[0] ?? 'Invitado'}", // Usamos split para obtener la parte antes del '@'
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ],
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {
                    deletePeople(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "¿Está seguro de querer eliminar a ${snapshot.data?[index]['name']}?",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text(
                                "Confirmar",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]['uid']),
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.car_repair, color: Colors.white),
                      ),
                      title: Text(
                        snapshot.data?[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: const Text(
                        "Haz clic para editar información",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () async {
                        await Navigator.pushNamed(
                          context,
                          "/edit",
                          arguments: {
                            "name": snapshot.data?[index]['name'],
                            "uid": snapshot.data?[index]['uid'],
                          },
                        );
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
