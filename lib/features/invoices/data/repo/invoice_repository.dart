import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/models/customer_model.dart';
import 'package:jawlati/core/models/payment_method.dart';
import 'package:jawlati/core/networking/api_result.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:jawlati/features/invoices/data/model/invoice/invoice_model.dart';

import '../apis/invoice_api_service.dart';
import '../model/enums.dart';
import '../model/invoice_item/invoice_item.dart';
import '../model/item/item_model.dart';
import '../model/discount_rule/discount_rule.dart';

abstract class InvoiceRepository {
  Future<List<ItemModel>> getAllItems();
  Future<List<Client>> getAllClients();
  Future<ApiResult<List<CustomerModel>>> getAllCustomers();
  Future<void> saveInvoice(InvoiceModel invoice);
  Future<List<InvoiceModel>> getInvoices();
  
  // Discount functionality
  Future<List<DiscountRule>> getDiscountRulesForItem(String itemId);
  Future<InvoiceItem> applyDiscountsToItem(InvoiceItem item, List<InvoiceItem> allInvoiceItems);
  Future<List<InvoiceItem>> applyLinkedDiscounts(List<InvoiceItem> items);
}

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceApiService _apiService;

  InvoiceRepositoryImpl(this._apiService);

  @override
  Future<List<ItemModel>> getAllItems() async {
    // محاكاة API call
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      ItemModel(
        id: '1',
        name: 'هالو بلدا 25غم',
        barcode: '1003000029',
        unit: 'بكيت',
        price: 0.35,
        stockQuantity: 10,
      ),
      ItemModel(
        id: '2',
        name: 'هالو بلدا 42غم',
        barcode: '1003000030',
        unit: 'بكيت',
        price: 0.70,
        stockQuantity: 40,
      ),
      ItemModel(
        id: '3',
        name: 'أرز أبو كاس 5كغ',
        barcode: '2003000001',
        unit: 'كيس',
        price: 15.50,
        stockQuantity: 55,
      ),
      ItemModel(
        id: '4',
        name: 'زيت زيتون 500مل',
        barcode: '3003000001',
        unit: 'زجاجة',
        price: 8.75,
        stockQuantity: 10,
      ),
      ItemModel(
        id: '5',
        name: 'سكر أبيض 1كغ',
        barcode: '4003000001',
        unit: 'كيس',
        price: 2.50,
        stockQuantity: 25,
      ),
      ItemModel(
        id: '6',
        name: 'شاي أحمد 100غ',
        barcode: '5003000001',
        unit: 'علبة',
        price: 4.25,
        stockQuantity: 18,
      ),
    ];
  }

  @override
  Future<List<Client>> getAllClients() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      Client(
        id: '1',
        name: 'سوبرماركت سلمى وسر',
        phone: '0795551234',
        address: 'نابلس - البلدة القديمة',
      ),
      Client(
        id: '2',
        name: 'سوبرماركت بس تست',
        phone: '0785559876',
        address: 'رام الله - المنارة',
      ),
    ];
  }

  @override
  Future<void> saveInvoice(InvoiceModel invoice) async {
    // محاكاة حفظ في قاعدة البيانات
    await Future.delayed(const Duration(seconds: 1));

    // هنا يتم الحفظ الفعلي
    AppLogger().info('Invoice saved: ${invoice.toJson()}');
  }

  @override
  Future<List<InvoiceModel>> getInvoices() async {
    await Future.delayed(const Duration(milliseconds: 800));

    // محاكاة بيانات الفواتير
    return [
      InvoiceModel(
        id: '1554',
        clientId: '1',
        clientName: 'سوبرماركت سلمى وسر',
        items: [
          InvoiceItem(
            itemId: '1_00009',
            name: 'هالو بلدا 25غم',
            unit: 'بكيت',
            price: 0.35,
            quantity: 4,
            stockQuantity: 40,
          ),
          InvoiceItem(
            itemId: '1_00005',
            name: 'أرز أبو كاس 5كغ',
            unit: 'كيس',
            price: 15.50,
            quantity: 2,
            stockQuantity: 33,
          ),
        ],
        subtotal: 16.9,
        totalAmount: 16.9,
        paidAmount: 16.9,
        remainingAmount: 0.0,
        notes: '',
        paymentMethod: AppPaymentMethod.cash,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        invoiceNumber: '1554',
        status: InvoiceStatus.paid,
      ),
      InvoiceModel(
        id: '1553',
        clientId: '2',
        clientName: 'سوبرماركت بس تست',
        items: [
          InvoiceItem(
            itemId: '1_00006',
            name: 'هالو بلدا 42غم',
            unit: 'بكيت',
            price: 0.70,
            quantity: 10,
            stockQuantity: 24,
          ),
        ],
        subtotal: 7.0,
        totalAmount: 7.0,
        paidAmount: 3.5,
        remainingAmount: 3.5,
        notes: 'دفعة جزئية',
        paymentMethod: AppPaymentMethod.credit,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        invoiceNumber: '1553',
        status: InvoiceStatus.partial,
      ),
      InvoiceModel(
        id: '1552',
        clientId: '1',
        clientName: 'سوبرماركت سلمى وسر',
        items: [
          InvoiceItem(
            itemId: '1_00007',
            name: 'زيت زيتون 500مل',
            unit: 'زجاجة',
            price: 8.75,
            quantity: 2,
            stockQuantity: 40,
          ),
        ],
        subtotal: 17.5,
        totalAmount: 17.5,
        paidAmount: 0.0,
        remainingAmount: 17.5,
        notes: '',
        paymentMethod: AppPaymentMethod.wallet('زين كاس', 'zain_cash'),
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        invoiceNumber: '1552',
        status: InvoiceStatus.draft,
      ),
    ];
  }

  @override
  Future<ApiResult<List<CustomerModel>>> getAllCustomers() async {
    try {
      // Call the API service
      final customers = await _apiService.getCustomers(
        userName: 'mfuqaha',
        userId: '1',
      );

      // Wrap the successful response in ApiResult.success
      return ApiResult.success(customers);
    } catch (e) {
      // Handle error
      return ApiResult.failure('Failed to load customers: $e');
    }
  }

  @override
  Future<List<DiscountRule>> getDiscountRulesForItem(String itemId) async {
    // Simulate API call to get discount rules
    await Future.delayed(const Duration(milliseconds: 100));
    
    // Return predefined discount rules based on item ID
    return _getPredefinedDiscountRules(itemId);
  }

  @override
  Future<InvoiceItem> applyDiscountsToItem(InvoiceItem item, List<InvoiceItem> allInvoiceItems) async {
    final discountRules = await getDiscountRulesForItem(item.itemId);
    if (discountRules.isEmpty) return item;

    InvoiceItem updatedItem = item;
    final List<String> appliedDiscounts = [];

    for (final rule in discountRules) {
      final result = _applyDiscountRule(rule, updatedItem, allInvoiceItems);
      if (result.item != updatedItem) {
        updatedItem = result.item;
        if (result.description != null) {
          appliedDiscounts.add(result.description!);
        }
      }
    }

    // Combine all discount descriptions
    if (appliedDiscounts.isNotEmpty) {
      updatedItem = updatedItem.copyWith(
        discountDescription: appliedDiscounts.join('; '),
        isDiscountApplied: true,
      );
    }

    return updatedItem;
  }

  @override
  Future<List<InvoiceItem>> applyLinkedDiscounts(List<InvoiceItem> items) async {
    final Map<String, double> linkedDiscounts = {};

    // Collect all linked discounts
    for (final item in items) {
      final rules = await getDiscountRulesForItem(item.itemId);
      
      for (final rule in rules.where((r) => r.isLinkedItemDiscount)) {
        if (rule.itemNoMinQty != null && 
            rule.linkedItemNo != null && 
            rule.linkedItemNewPrice != null &&
            item.quantity >= rule.itemNoMinQty!) {
          
          linkedDiscounts[rule.linkedItemNo!] = rule.linkedItemNewPrice!;
        }
      }
    }

    // Apply linked discounts
    return items.map((item) {
      if (linkedDiscounts.containsKey(item.itemId)) {
        final originalPrice = item.originalPrice ?? item.price;
        final newPrice = linkedDiscounts[item.itemId]!;
        final discountAmount = (originalPrice - newPrice) * item.quantity;

        return item.copyWith(
          originalPrice: originalPrice,
          price: newPrice,
          discountAmount: discountAmount,
          appliedDiscountType: "4",
          isDiscountApplied: true,
          discountDescription: "خصم مرتبط",
        );
      }
      return item;
    }).toList();
  }

  // Helper method to get predefined discount rules
  List<DiscountRule> _getPredefinedDiscountRules(String itemId) {
    // Define discount rules based on item ID
    switch (itemId) {
      case '1': // هالو بلدا 25غم
        return [
          DiscountRule(
            discountType: "1",
            itemNo: itemId,
            description: "خصم مباشر 20%",
            itemNoNewPrice: 0.28, // 0.35 * 0.80
          ),
        ];
      
      case '2': // هالو بلدا 42غم
        return [
          DiscountRule(
            discountType: "2",
            itemNo: itemId,
            description: "خصم 25% للكمية أكثر من 5",
            itemNoMinQty: 5,
            itemNoNewPrice: 0.525, // 0.70 * 0.75
          ),
        ];
      
      case '3': // أرز أبو كاس 5كغ
        return [
          DiscountRule(
            discountType: "3",
            itemNo: itemId,
            description: "اشتري 3 واحصل على 1 مجاناً",
            itemNoMinQty: 3,
            itemNo2ndItemNo: itemId,
            itemNo2ndQty: 1,
          ),
        ];
      
      case '4': // زيت زيتون 500مل
        return [
          DiscountRule(
            discountType: "1",
            itemNo: itemId,
            description: "خصم مباشر 15%",
            itemNoNewPrice: 7.44, // 8.75 * 0.85
          ),
          DiscountRule(
            discountType: "4",
            itemNo: itemId,
            description: "خصم مرتبط للمادة رقم 1",
            itemNoMinQty: 2,
            linkedItemNo: "1",
            linkedItemNewPrice: 0.25, // خصم للهالو بلدا 25غم
          ),
        ];

      case '5': // سكر أبيض 1كغ
        return [
          DiscountRule(
            discountType: "2",
            itemNo: itemId,
            description: "خصم 30% للكمية أكثر من 10",
            itemNoMinQty: 10,
            itemNoNewPrice: 1.75, // 2.50 * 0.70
          ),
        ];

      case '6': // شاي أحمد 100غ
        return [
          DiscountRule(
            discountType: "1",
            itemNo: itemId,
            description: "خصم مباشر 10%",
            itemNoNewPrice: 3.83, // 4.25 * 0.90
          ),
        ];
      
      default:
        return [];
    }
  }

  // Helper method to apply a specific discount rule
  _DiscountResult _applyDiscountRule(
    DiscountRule rule,
    InvoiceItem item,
    List<InvoiceItem> allInvoiceItems,
  ) {
    switch (rule.discountType) {
      case "1":
        return _applyDirectPriceOverride(rule, item);
      case "2":
        return _applyConditionalPriceDrop(rule, item);
      case "3":
        return _applyBuyAGetBFree(rule, item);
      case "4":
        return _applyLinkedItemDiscount(rule, item);
      default:
        return _DiscountResult(item: item);
    }
  }

  // Type 1: Direct price override
  _DiscountResult _applyDirectPriceOverride(DiscountRule rule, InvoiceItem item) {
    if (rule.itemNoNewPrice == null) return _DiscountResult(item: item);

    final originalPrice = item.originalPrice ?? item.price;
    final newPrice = rule.itemNoNewPrice!;
    final discountAmount = (originalPrice - newPrice) * item.quantity;

    return _DiscountResult(
      item: item.copyWith(
        originalPrice: originalPrice,
        price: newPrice,
        discountAmount: discountAmount,
        appliedDiscountType: "1",
      ),
      description: rule.description,
    );
  }

  // Type 2: Conditional price drop
  _DiscountResult _applyConditionalPriceDrop(DiscountRule rule, InvoiceItem item) {
    if (rule.itemNoNewPrice == null || rule.itemNoMinQty == null) {
      return _DiscountResult(item: item);
    }

    if (item.quantity < rule.itemNoMinQty!) {
      return _DiscountResult(item: item);
    }

    final originalPrice = item.originalPrice ?? item.price;
    final newPrice = rule.itemNoNewPrice!;
    final discountAmount = (originalPrice - newPrice) * item.quantity;

    return _DiscountResult(
      item: item.copyWith(
        originalPrice: originalPrice,
        price: newPrice,
        discountAmount: discountAmount,
        appliedDiscountType: "2",
      ),
      description: rule.description,
    );
  }

  // Type 3: Buy A get B free (handled through bonus quantity)
  _DiscountResult _applyBuyAGetBFree(DiscountRule rule, InvoiceItem item) {
    if (rule.itemNoMinQty == null || 
        rule.itemNo2ndItemNo == null || 
        rule.itemNo2ndQty == null) {
      return _DiscountResult(item: item);
    }

    if (item.quantity < rule.itemNoMinQty!) {
      return _DiscountResult(item: item);
    }

    // Calculate bonus quantity
    final bonusQty = (item.quantity ~/ rule.itemNoMinQty!) * rule.itemNo2ndQty!;
    
    return _DiscountResult(
      item: item.copyWith(
        appliedDiscountType: "3",
        quantityOfBonus: bonusQty,
      ),
      description: rule.description,
    );
  }

  // Type 4: Linked item discount (affects other items)
  _DiscountResult _applyLinkedItemDiscount(DiscountRule rule, InvoiceItem item) {
    if (rule.itemNoMinQty == null || 
        rule.linkedItemNo == null || 
        rule.linkedItemNewPrice == null) {
      return _DiscountResult(item: item);
    }

    if (item.quantity < rule.itemNoMinQty!) {
      return _DiscountResult(item: item);
    }

    // This type affects other items, handled at the invoice level
    return _DiscountResult(
      item: item.copyWith(
        appliedDiscountType: "4",
      ),
      description: rule.description,
    );
  }
}

// Helper class for discount results
class _DiscountResult {
  final InvoiceItem item;
  final String? description;

  _DiscountResult({
    required this.item,
    this.description,
  });
}
