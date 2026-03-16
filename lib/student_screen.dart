import 'dart:math';

import 'package:flutter/material.dart';
import 'student.dart';

void main() => runApp(const Card_Example());

//API Simulation
List<Student> loadStudents() {
  return [
    Student(nombre: "Juanito", apellido: "Ramirez", edad: 20),
    Student(nombre: "Gabriel", apellido: "Mejía", edad: 10),
    Student(nombre: "Alejandro", apellido: "Pineda", edad: 30),
  ];
}

Student GetRandomStudent(List<Student> students) {
  Random random = Random();
  int randomIndex = random.nextInt(students.length);

  return students[randomIndex];
}

class Card_Example extends StatelessWidget {
  const Card_Example({super.key});

  @override
  Widget build(BuildContext context) {
    List<Student> students = loadStudents() as List<Student>;
    Student student = GetRandomStudent(students);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Estudiantes")),
        body: Student_Card(student: student),
      ),
    );
  }
}

class Student_Card extends StatelessWidget {
  final Student student;
  const Student_Card({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint("Hola Profe");
          },
          child: SizedBox(
            width: 300,
            height: 100,
            child: Text(
              " Nombre: ${student.nombre} \n Apellido: ${student.apellido} \n Edad: ${student.edad}",
            ),
          ),
        ),
      ),
    );
  }
}
