class Product {
  final int id;
  final String name;
  final String price;
  final String category;
  final String imageId;
  final String? tag;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageId,
    this.tag,
  });

  String get imageUrl =>
      'https://images.unsplash.com/$imageId?w=500&h=500&fit=crop&auto=format';
}

const kCategories = ['Tous', 'Vue', 'Soleil', 'Hommes', 'Femmes', 'Enfants'];

const kProducts = [
  Product(id: 1,  name: 'Clarion Slim',   price: '18 500', category: 'Vue',     imageId: 'photo-1556306510-31ca015374b0', tag: 'Populaire'),
  Product(id: 2,  name: 'Optic Ronde',    price: '15 000', category: 'Vue',     imageId: 'photo-1608539733377-5557e02926b5'),
  Product(id: 3,  name: 'Eclipse Noir',   price: '22 000', category: 'Soleil',  imageId: 'photo-1611222777277-61319d63ca94', tag: 'Nouveau'),
  Product(id: 4,  name: 'Havana Gold',    price: '25 500', category: 'Soleil',  imageId: 'photo-1596993100471-c3905dafa78e'),
  Product(id: 5,  name: 'Oxford Classic', price: '19 000', category: 'Hommes',  imageId: 'photo-1608906709312-fe17f7c1a5a6'),
  Product(id: 6,  name: 'Metro Square',   price: '17 500', category: 'Hommes',  imageId: 'photo-1589176449149-71f7ea77ec25'),
  Product(id: 7,  name: 'Parisian Cat',   price: '21 000', category: 'Femmes',  imageId: 'photo-1653257889967-4da0846f4ac3'),
  Product(id: 8,  name: 'Rose Aviator',   price: '23 000', category: 'Femmes',  imageId: 'photo-1727834776020-06233f071a2a', tag: 'Exclusif'),
  Product(id: 9,  name: 'Mini Explorer',  price: '12 000', category: 'Enfants', imageId: 'photo-1577410323423-73c360e27bc8'),
  Product(id: 10, name: 'Kiddo Flex',     price: '10 500', category: 'Enfants', imageId: 'photo-1697659626446-47a5ad227c8a'),
];