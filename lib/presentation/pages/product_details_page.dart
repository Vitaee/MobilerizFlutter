import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a CustomScrollView to allow for a collapsing app bar
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.name),
              background: Hero(
                tag: 'product_${product.id}',
                child: Image.network(
                  product.photoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  product.description,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Divider(),
              ListTile(
                title: Text('Price'),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              ),
              // Add more product details here
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add to cart functionality
        },
        child: Icon(Icons.shopping_cart),
        tooltip: 'Add to Cart',
      ),
    );
  }
}
