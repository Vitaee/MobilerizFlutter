import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/providers/product_provider.dart';
import 'package:flutter_app/presentation/widgets/product_list_item.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load products when the widget is first inserted into the widget tree
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                productProvider.searchProducts(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search products...',
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await productProvider.loadProducts();
        },
        child: Container(
          color: Colors.grey[200],
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (provider.errorMessage.isNotEmpty) {
                return Center(child: Text(provider.errorMessage));
              } else if (provider.filteredProducts.isEmpty) {
                return const Center(child: Text('No products available.'));
              } else {
                return ListView.builder(
                  itemCount: provider.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = provider.filteredProducts[index];
                    return ProductListItem(product: product);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
