import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../data/dummy_data.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar_widget.dart';

class ProductListScreen extends StatefulWidget {
  final String? categoryFilter;

  const ProductListScreen({super.key, this.categoryFilter});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String _sortBy = 'Popular';
  final List<String> _sortOptions = ['Popular', 'Newest', 'Price: Low to High', 'Price: High to Low'];

  List<dynamic> get filteredProducts {
    var products = dummyProducts;
    if (widget.categoryFilter != null) {
      products = dummyProducts.where((p) => 
        p.category.toLowerCase().contains(widget.categoryFilter!.toLowerCase())
      ).toList();
    }
    
    switch (_sortBy) {
      case 'Price: Low to High':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Newest':
        // Keep original order for newest
        break;
      default:
        products.sort((a, b) => b.rating.compareTo(a.rating));
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        backgroundColor: AppColors.getCardBackgroundColor(context),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: AppColors.getTextPrimaryColor(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.categoryFilter ?? 'All Products',
          style: GoogleFonts.poppins(
            color: AppColors.getTextPrimaryColor(context),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: AppColors.getTextPrimaryColor(context)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list_rounded, color: AppColors.getTextPrimaryColor(context)),
            onPressed: () => _showFilterSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sort & Filter Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.getCardBackgroundColor(context),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filteredProducts.length} Products',
                  style: GoogleFonts.poppins(
                    color: AppColors.getTextSecondaryColor(context),
                    fontSize: 13,
                  ),
                ),
                GestureDetector(
                  onTap: () => _showSortSheet(context),
                  child: Row(
                    children: [
                      Text(
                        'Sort: ',
                        style: GoogleFonts.poppins(
                          color: AppColors.getTextSecondaryColor(context),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        _sortBy,
                        style: GoogleFonts.poppins(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Products Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSortSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sort By',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.getTextPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 16),
              ...(_sortOptions.map((option) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Radio<String>(
                  value: option,
                  groupValue: _sortBy,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() => _sortBy = value!);
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  option,
                  style: GoogleFonts.poppins(
                    color: _sortBy == option ? AppColors.primary : AppColors.getTextPrimaryColor(context),
                    fontWeight: _sortBy == option ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                onTap: () {
                  setState(() => _sortBy = option);
                  Navigator.pop(context);
                },
              ))),
            ],
          ),
        );
      },
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.getTextPrimaryColor(context),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear All',
                      style: GoogleFonts.poppins(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Price Range',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.getTextPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 12),
              RangeSlider(
                values: const RangeValues(0, 5000),
                min: 0,
                max: 10000,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.primaryLight,
                onChanged: (values) {},
              ),
              const SizedBox(height: 24),
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.getTextPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categories.map((cat) => FilterChip(
                  label: Text(cat.name.replaceAll('\n', ' ')),
                  selected: false,
                  onSelected: (value) {},
                  selectedColor: AppColors.primaryLight,
                  checkmarkColor: AppColors.primary,
                )).toList(),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Apply Filters',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
