import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce/app/modules/login/controllers/login_controller.dart';
import 'package:e_commerce/app/modules/register/controllers/register_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LoginController Form Validation Tests', () {
    late LoginController controller;

    setUp(() {
      controller = LoginController();
      controller.onInit();
    });

    tearDown(() {
      controller.onClose();
    });

    test('Validasi email kosong menghasilkan pesan error', () {
      expect(controller.validateEmail(''), 'Alamat email wajib diisi');
      expect(controller.validateEmail(null), 'Alamat email wajib diisi');
      expect(controller.validateEmail('   '), 'Alamat email wajib diisi');
    });

    test('Validasi format email salah menghasilkan pesan error', () {
      expect(controller.validateEmail('bukan-email'), contains('tidak valid'));
      expect(controller.validateEmail('siswa@sekolah'), contains('tidak valid'));
      expect(controller.validateEmail('@sekolah.sch.id'), contains('tidak valid'));
    });

    test('Validasi format email benar menghasilkan null', () {
      expect(controller.validateEmail('siswa@sekolah.sch.id'), isNull);
      expect(controller.validateEmail('guru.flutter@gmail.com'), isNull);
    });

    test('Validasi kata sandi < 6 karakter menghasilkan pesan error', () {
      expect(controller.validatePassword('12345'), 'Kata sandi minimal 6 karakter');
      expect(controller.validatePassword(''), 'Kata sandi wajib diisi');
    });

    test('Validasi kata sandi >= 6 karakter valid', () {
      expect(controller.validatePassword('rahasia123'), isNull);
    });

    test('Toggle password visibility bekerja secara reaktif', () {
      expect(controller.isPasswordHidden.value, isTrue);
      controller.togglePasswordVisibility();
      expect(controller.isPasswordHidden.value, isFalse);
    });
  });

  group('RegisterController Form Validation Tests', () {
    late RegisterController controller;

    setUp(() {
      controller = RegisterController();
      controller.onInit();
    });

    tearDown(() {
      controller.onClose();
    });

    test('Validasi nama minimal 3 karakter', () {
      expect(controller.validateName(''), 'Nama lengkap wajib diisi');
      expect(controller.validateName('Al'), 'Nama minimal 3 karakter');
      expect(controller.validateName('Dimas Pratama'), isNull);
    });

    test('Validasi konfirmasi kata sandi harus identik', () {
      controller.passwordController.text = 'password123';

      expect(
        controller.validateConfirmPassword('berbeda123'),
        'Konfirmasi kata sandi tidak cocok dengan sandi di atas',
      );
      expect(controller.validateConfirmPassword('password123'), isNull);
    });
  });
}
