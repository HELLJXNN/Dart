// Gestión de Biblioteca en Dart - Aplicación CRUD desde Consola
import 'dart:io';

// Funciones

// Create
void createBook(
  Map<String, Map<String, dynamic>> library,
  String title,
  String author,
  int year,
) {
  Map<String, dynamic> bookDetails = {
    "autor": author,
    "anio": year,
  };
  library[title] = bookDetails;
}

// Read
void readBooks(Map<String, Map<String, dynamic>> library) {
  print("--- Lista de Libros ---");
  if (library.isEmpty) {
    print("No hay libros registrados en la biblioteca.");
  } else {
    library.forEach((title, details) {
      String author = details["autor"];
      int year = details["anio"];
      print("Titulo: $title, Autor: $author, Año: $year");
    });
  }
  print("-------------------------\n");
}

// Update
void updateBook(Map<String, Map<String, dynamic>> biblioteca) {
  stdout.write("Ingrese el título del libro que desea actualizar: ");
  String? titleToUpdate = stdin.readLineSync();

  if (titleToUpdate != null && biblioteca.containsKey(titleToUpdate)) {
    stdout.write("Ingrese el nuevo año de publicación: ");
    String? newYearInput = stdin.readLineSync();
    int? newYear = int.tryParse(newYearInput ?? '0');

    if (newYear != null) {
      biblioteca[titleToUpdate]?["anio"] = newYear;
      print("El libro '$titleToUpdate' ha sido actualizado exitosamente.\n");
    } else {
      print("Error: El año ingresado no es válido.\n");
    }
  } else {
    print("Error: El libro '$titleToUpdate' no se encontró en la biblioteca.\n");
  }
}

// Delete
void deleteBook(Map<String, Map<String, dynamic>> biblioteca) {
  stdout.write("Ingrese el título del libro que desea eliminar: ");
  String? titleToDelete = stdin.readLineSync();

  if (titleToDelete != null && biblioteca.containsKey(titleToDelete)) {
    biblioteca.remove(titleToDelete);
    print("El libro '$titleToDelete' ha sido eliminado exitosamente.\n");
  } else {
    print("Error: El libro '$titleToDelete' no se encontró en la biblioteca.\n");
  }
}

//main

void main() {
  int op;
  Map<String, Map<String, dynamic>> biblioteca = {};

  do {
    print("Biblioteca Jenn");
    print("1. Agregar Libro");
    print("2. Listar Libros");
    print("3. Actualizar Libro");
    print("4. Eliminar Libro");
    print("5. Salir del Programa");
    stdout.write("Seleccione una opción: ");

    String? input = stdin.readLineSync();
    op = int.tryParse(input ?? '0') ?? 0;

    switch (op) {
      case 1:
        stdout.write("Ingrese el titulo del libro: ");
        String? bookName = stdin.readLineSync();
        stdout.write("Ingrese el autor del libro: ");
        String? authorName = stdin.readLineSync();
        stdout.write("Ingrese el año del libro: ");
        String? bookYear = stdin.readLineSync();
        int? bookYearInt = int.tryParse(bookYear ?? '0');

        if (bookName != null && authorName != null && bookYearInt != null && bookName.isNotEmpty && authorName.isNotEmpty) {
          createBook(biblioteca, bookName, authorName, bookYearInt);
          print("Libro '$bookName' creado exitosamente!\n");
        } else {
          print("Los datos no pueden estar vacíos o no son válidos.\n");
        }
        break;
      case 2:
        readBooks(biblioteca);
        break;
      case 3:
        updateBook(biblioteca);
        break;
      case 4:
        deleteBook(biblioteca);
        break;
      case 5:
        print("Saliendo del programa...");
        break;
      default:
        print("Opción Inválida, Intente nuevamente\n");
        break;
    }
  } while (op != 5);
}