import 'package:flutter_test/flutter_test.dart';
import '../app_perufest/lib/models/usuario.dart';
import '../app_perufest/lib/models/evento.dart';
import '../app_perufest/lib/services/validador_service.dart';

void main() {
  group('Pruebas Unitarias - PeruFest', () {
    
    // Prueba 1: Validar modelo Usuario
    test('Usuario debe crear instancia correctamente', () {
      // Arrange
      final usuario = Usuario(
        id: '123',
        nombre: 'Juan Pérez',
        email: 'juan@test.com',
        rol: 'usuario'
      );
      
      // Assert
      expect(usuario.id, equals('123'));
      expect(usuario.nombre, equals('Juan Pérez'));
      expect(usuario.email, equals('juan@test.com'));
      expect(usuario.rol, equals('usuario'));
    });

    // Prueba 2: Validar modelo Evento
    test('Evento debe crear instancia con datos válidos', () {
      // Arrange
      final evento = Evento(
        id: 'evt123',
        titulo: 'Festival de Música',
        descripcion: 'Gran evento musical',
        fecha: DateTime(2024, 12, 25)
      );
      
      // Assert
      expect(evento.id, equals('evt123'));
      expect(evento.titulo, equals('Festival de Música'));
      expect(evento.descripcion, equals('Gran evento musical'));
      expect(evento.fecha.year, equals(2024));
    });

    // Prueba 3: Validar servicio de validación de email
    test('ValidadorService debe validar email correctamente', () {
      // Arrange
      final validador = ValidadorService();
      
      // Act & Assert
      expect(validador.validarEmail('test@gmail.com'), isTrue);
      expect(validador.validarEmail('correo-invalido'), isFalse);
      expect(validador.validarEmail(''), isFalse);
      expect(validador.validarEmail('usuario@dominio.com'), isTrue);
    });
  });
}
