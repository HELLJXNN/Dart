import 'dart:io';

//Funcions

// Create
void createProduct(
  Map<String, Map<String, dynamic>> product,
  String name,
  double price,
  int quantity,
) {
  Map<String, dynamic> productDetails = {"precio": price, "cantidad": quantity};
  product[name] = productDetails;
}

// Read
void listProducts(Map<String, Map<String, dynamic>> product) {
  print("--- Lista de Productos ---");
  if (product.isEmpty) {
    print("No hay productos en la tienda.");
  } else {
    int index = 1;
    product.forEach((name, details) {
      double price = details["precio"];
      int quantity = details["cantidad"];
      print("$index. Nombre: $name, Precio: $price, Cantidad: $quantity");
      index++;
    });
  }
  print("-------------------------\n");
}
// Update
void updateProduct(Map<String, Map<String, dynamic>> products) {
  if (products.isEmpty) {
    print("No hay productos para actualizar.\n");
    return;
  }

  // Mostrar productos con índice
  int index = 1;
  List<String> keys = products.keys.toList();
  print("--- Productos Disponibles ---");
  for (var name in keys) {
    double price = products[name]?["precio"];
    int quantity = products[name]?["cantidad"];
    print("$index. Nombre: $name, Precio: $price, Cantidad: $quantity");
    index++;
  }

  stdout.write("Ingrese el número del producto que desea actualizar: ");
  String? input = stdin.readLineSync();
  int? selectedIndex = int.tryParse(input ?? '');

  if (selectedIndex != null && selectedIndex > 0 && selectedIndex <= keys.length) {
    String selectedProduct = keys[selectedIndex - 1];
    double oldPrice = products[selectedProduct]?["precio"];
    int oldQuantity = products[selectedProduct]?["cantidad"];

    stdout.write("Ingrese el nuevo precio (deje vacío para mantener $oldPrice): ");
    String? newPriceInput = stdin.readLineSync();
    double? newPrice = newPriceInput != null && newPriceInput.isNotEmpty
        ? double.tryParse(newPriceInput)
        : oldPrice;

    stdout.write("Ingrese la nueva cantidad (deje vacío para mantener $oldQuantity): ");
    String? newQuantityInput = stdin.readLineSync();
    int? newQuantity = newQuantityInput != null && newQuantityInput.isNotEmpty
        ? int.tryParse(newQuantityInput)
        : oldQuantity;

    if (newPrice != null && newQuantity != null) {
      products[selectedProduct]?["precio"] = newPrice;
      products[selectedProduct]?["cantidad"] = newQuantity;
      print("El producto '$selectedProduct' ha sido actualizado exitosamente.\n");
    } else {
      print("Error: Los datos ingresados no son válidos.\n");
    }
  } else {
    print("Error: Número de producto inválido.\n");
  }
}
// Delete
void deleteProduct(Map<String, Map<String, dynamic>> products) {
  if (products.isEmpty) {
    print("No hay productos para eliminar.\n");
    return;
  }

  int index = 1;
  List<String> keys = products.keys.toList();
  print("--- Productos Disponibles ---");
  for (var name in keys) {
    double price = products[name]?["precio"];
    int quantity = products[name]?["cantidad"];
    print("$index. Nombre: $name, Precio: $price, Cantidad: $quantity");
    index++;
  }

  stdout.write("Ingrese el número del producto que desea eliminar: ");
  String? input = stdin.readLineSync();
  int? selectedIndex = int.tryParse(input ?? '');

  if (selectedIndex != null &&
      selectedIndex > 0 &&
      selectedIndex <= keys.length) {
    String selectedProduct = keys[selectedIndex - 1];
    products.remove(selectedProduct);
    print("El producto '$selectedProduct' ha sido eliminado exitosamente.\n");
  } else {
    print("Error: Número de producto inválido.\n");
  }
}

void main() {
  int op;
  Map<String, Map<String, dynamic>> products = {};

  do {
    print("Productos Tienda Jenn");
    print("1. Agregar Producto");
    print("2. Listar Producto");
    print("3. Actualizar Producto");
    print("4. Eliminar Producto");
    print("5. Salir del Programa");
    stdout.write("Seleccione una opción: ");

    String? input = stdin.readLineSync();
    op = int.tryParse(input ?? '0') ?? 0;
    switch (op) {
      case 1:
        stdout.write("Ingrese el nombre del producto: ");
        String? productName = stdin.readLineSync();
        stdout.write("Ingrese el precio del producto: ");
        String? priceInput = stdin.readLineSync();
        double? price = double.tryParse(priceInput ?? '0');
        stdout.write("Ingrese la cantidad del producto: ");
        String? quantityInput = stdin.readLineSync();
        int? quantity = int.tryParse(quantityInput ?? '0');

        if (productName != null &&
            price != null &&
            quantity != null &&
            productName.isNotEmpty) {
          createProduct(products, productName, price, quantity);
          print("Producto '$productName' creado exitosamente!\n");
        } else {
          print("Los datos no pueden estar vacíos o no son válidos.\n");
        }
        break;
      case 2:
        listProducts(products);
        break;
      case 3:
        updateProduct(products);
        break;
      case 4:
        deleteProduct(products);
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
