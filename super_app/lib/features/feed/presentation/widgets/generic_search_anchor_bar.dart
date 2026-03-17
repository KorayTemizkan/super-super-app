import 'package:flutter/material.dart';
import 'package:super_app/core/widgets/searchable_model.dart';

/// Generic arama çubuğu widget'ı
/// Herhangi bir [Searchable] implement eden model listesiyle çalışır
///
/// Örnek kullanım:
/// ```dart
/// GenericSearchAnchorBar<ProductModel>(
///   items: products,
///   onItemSelected: (product) => context.go('/product', extra: product),
///   hintText: 'Ürün ara...',
/// )
/// ```
///

/*

Şablon kullanımı güzel bir alışkanlık, edinirim zamanla.

<T> ile bunun içine ne koyacağını önceden bilmediğimizi belirtiyoruz, yine soyutlama

extends Searchable bir güvenlik önlemidir. Yine bir arayüz uygulaması yapıyoruz
*/
class GenericSearchAnchorBar<T extends Searchable> extends StatelessWidget {
  /// Aranacak item listesi
  final List<T> items;

  /// Bir item seçildiğinde çağrılacak callback
  final void Function(T item) onItemSelected;

  /// Arama çubuğundaki placeholder text
  final String hintText;

  /// Arama sonuçlarındaki her item'ın başındaki ikon
  final Widget Function(T item)? leadingIcon;

  /// Arama çubuğunun başındaki widget
  final Widget? barLeading;

  final Color? _viewBackgroundColor = Colors.white;
  final Color? _barBackgroundColor = Colors.white;

  const GenericSearchAnchorBar({
    super.key,
    required this.items,
    required this.onItemSelected,
    this.hintText = 'Ara...',
    this.leadingIcon,
    this.barLeading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [mySearchAnchorBar(), SizedBox(width: 8)],
      ),
    );
  }

  Expanded mySearchAnchorBar() {
    return Expanded(
      child: SearchAnchor.bar(
        // Görsel düzenlemeler
        barHintText: hintText,
        barElevation: WidgetStatePropertyAll(1),
        barLeading: barLeading,
        viewBackgroundColor: _viewBackgroundColor,
        barBackgroundColor: WidgetStatePropertyAll(_barBackgroundColor),
        isFullScreen: false,
        dividerColor: Color(0xFFFF5722),
        barSide: const WidgetStatePropertyAll(
          BorderSide(color: Color(0xFFFF5722), width: 1),
        ),

        // Arama motorumuz burası
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
              final String input = controller.text.toLowerCase();

              // Arama yoksa çıkış yap
              if (input.isEmpty) {
                return [];
              }

              // Filtreleme kısmı -> Arrays dosyamdan hatırla
              return items
                  .where(
                    (item) => item.searchableText.toLowerCase().contains(input),
                  )
                  .map(
                    (filteredItem) => ListTile(
                      leading: leadingIcon?.call(filteredItem),
                      title: Text(filteredItem.searchableText),
                      subtitle: filteredItem.searchableSubtitle != null
                          ? Text(filteredItem.searchableSubtitle!)
                          : null,
                      onTap: () {
                        controller.closeView(filteredItem.searchableText);
                        onItemSelected(filteredItem);
                      },
                    ),
                  )
                  .toList();
            },
      ),
    );
  }
}
