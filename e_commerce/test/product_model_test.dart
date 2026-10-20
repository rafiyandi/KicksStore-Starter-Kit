import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce/app/data/models/product_model.dart';

void main() {
  group('ProductModel JSON Serialization Tests (Sesi 05)', () {
    test('fromJson berhasil mem-parsing response DummyJSON dengan konversi USD ke IDR', () {
      final dummyJson = {
        'id': 101,
        'title': 'Nike Air Zoom Pegasus',
        'category': 'mens-shoes',
        'price': 120, // Harga USD
        'rating': 4.85,
        'thumbnail': 'https://dummyjson.com/image/101.jpg',
        'description': 'Sepatu lari tangguh untuk pelari maraton.',
        'reviews': [
          {'rating': 5, 'comment': 'Sangat empuk!'},
          {'rating': 4, 'comment': 'Bagus'},
        ],
      };

      final product = ProductModel.fromJson(dummyJson);

      expect(product.id, '101');
      expect(product.name, 'Nike Air Zoom Pegasus');
      expect(product.category, 'Mens-shoes');
      expect(product.price, 120 * 15000); // 1.800.000 IDR
      expect(product.formattedPrice, contains('1.800.000'));
      expect(product.rating, 4.85);
      expect(product.reviewCount, 2);
      expect(product.imageUrl, 'https://dummyjson.com/image/101.jpg');
    });

    test('fromJson defensif terhadap data kosong atau null', () {
      final emptyJson = <String, dynamic>{};

      final product = ProductModel.fromJson(emptyJson);

      expect(product.id, startsWith('prod-'));
      expect(product.name, 'Sepatu Sneakers');
      expect(product.category, 'Lifestyle');
      expect(product.price, 150000);
      expect(product.rating, 4.8);
      expect(product.imageUrl, isNotEmpty);
      expect(product.description, isNotEmpty);
    });

    test('toJson menghasilkan Map yang konsisten', () {
      const product = ProductModel(
        id: 'shoe-01',
        name: 'Jordan Retro',
        category: 'Basketball',
        price: 2500000,
        rating: 4.9,
        reviewCount: 150,
        imageUrl: 'https://example.com/shoe.jpg',
        description: 'Deskripsi sepatu',
      );

      final json = product.toJson();

      expect(json['id'], 'shoe-01');
      expect(json['name'], 'Jordan Retro');
      expect(json['price'], 2500000);
    });
  });
}
