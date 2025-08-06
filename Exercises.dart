import 'dart:io';
import 'dart:math';

void main() {
  int option;

  do {
    print("---");
    print("Selecciona el número del algoritmo a usar:");
    print("1. Calcular distancia");
    print("2. Calcular promedio de notas");
    print("3. Calcular puntos de un equipo");
    print("4. Calcular planilla de empleado");
    print("5. Calcular hipotenusa de un triángulo");
    print("6. Convertir °C a °F");
    print("7. Salir");
    print("---");
    String? input = stdin.readLineSync();
    option = int.tryParse(input ?? '0') ?? 0;

    switch (option) {
      case 1:
        print("Digite la velocidad: ");
        double? velocidad = double.tryParse(stdin.readLineSync() ?? '0');
        print("Digite el tiempo: ");
        double? time = double.tryParse(stdin.readLineSync() ?? '0');
        double distanceResult = distance(velocidad, time);
        print("La distancia recorrida es: $distanceResult\n metros");
        break;
      case 2:
        print("Ingrese la nota 1: ");
        double? grade1 = double.tryParse(stdin.readLineSync() ?? '0');
        print("Ingrese la nota 2: ");
        double? grade2 = double.tryParse(stdin.readLineSync() ?? '0');
        print("Ingrese la nota 3: ");
        double? grade3 = double.tryParse(stdin.readLineSync() ?? '0');
        double averageResult = average(grade1, grade2, grade3);
        print("El promedio del estudiante es de: $averageResult\n");
        break;

      case 3:
        print("Ingrese la cantidad de partidos ganados: ");
        int? won = int.tryParse(stdin.readLineSync() ?? '0');
        print("Ingrese la cantidad de partidos empatados: ");
        int? tied = int.tryParse(stdin.readLineSync() ?? '0');
        print("Ingrese la cantidad de partidos perdidos: ");
        int? lost = int.tryParse(stdin.readLineSync() ?? '0');
        int totalPoints = points(won, tied, lost);

        print(
          "El equipo ha obtenido $totalPoints puntos. (Ganados: $won, Empatados: $tied, Perdidos: $lost)\n",
        );
        break;

      case 4:
        print("Ingrese el nombre del empleado: ");
        String? employeeName = stdin.readLineSync();
        print("Ingrese la cantidad de horas laboradas en el mes: ");
        int? employeeHours = int.tryParse(stdin.readLineSync() ?? '0');
        print("Ingrese la tarifa por hora: ");
        double? rateHourEmployee = double.tryParse(stdin.readLineSync() ?? '0');
        double accruedEmployee = calculateTotalAccrued(
          employeeHours,
          rateHourEmployee,
        );
        print(
          "El empleado: $employeeName\n laboró $employeeHours\n y el total devengado es de: $accruedEmployee",
        );
        break;

      case 5:
        print("Por favor, ingrese la longitud del primer cateto (a):");
        double? a = double.tryParse(stdin.readLineSync() ?? '');

        print("Ahora, ingrese la longitud del segundo cateto (b):");
        double? b = double.tryParse(stdin.readLineSync() ?? '');

        if (a == null || b == null || a <= 0 || b <= 0) {
          print(
            "Error: Por favor, ingrese valores numéricos positivos para los catetos.\n",
          );
        } else {
          double hipotenusa = calculateHypotenuse(a, b);
          print("\nEl cálculo de la hipotenusa es:");
          print("Cateto a = $a");
          print("Cateto b = $b");
          print("La hipotenusa (H) es = $hipotenusa\n");
        }
        break;

      case 6:
        print("Ingrese la temperatura en grados Celcius: ");
        double? celsius = double.tryParse(stdin.readLineSync() ?? '');
        double? fahrenheit = celsiusToFahrenheit(celsius);
        print("La temperatura de $celsius°C es igual a $fahrenheit°F.\n");
        break;

      case 7:
        print("Saliendo del programa...\n");
        break;

      default:
        print("Opción inválida. Intenta de nuevo.\n");
        break;
    }
  } while (option != 7);
}

// Functions

double distance(double? a, double? b) {
  if (a == null || b == null) {
    return 0.0;
  }
  return a * b;
}

double average(double? a, double? b, double? c) {
  double valorA = a ?? 0.0;
  double valorB = b ?? 0.0;
  double valorC = c ?? 0.0;
  return (valorA + valorB + valorC) / 3;
}

int points(int? a, int? b, int? c) {
  int win = (a ?? 0) * 3;
  int draw = (b ?? 0) * 1;
  int lose = (c ?? 0) * 0;
  return (win + draw + lose);
}

double calculateTotalAccrued(int? a, double? b) {
  double totalAccrued = (a ?? 0) * (b ?? 0.0);
  return totalAccrued;
}

double calculateHypotenuse(double a, double b) {
  return sqrt(pow(a, 2) + pow(b, 2));
}

double celsiusToFahrenheit(double? c) {
  double celcius = c ?? 0.0;
  return (celcius * 1.8) + 32;
}
