import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/models/client_model.dart';
import '../../data/repo/client_repository.dart';
import 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  final ClientRepository _repository;
  final AppLogger _logger = AppLogger();

  AddClientCubit(this._repository) : super(const AddClientState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController taxNumberController = TextEditingController();
  final TextEditingController managerNameController = TextEditingController();

  String? commercialRegistryImagePath;
  String? residenceImagePath;

  ClientType selectedClientType = ClientType.individual;
  OrderType selectedOrderType = OrderType.retail;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateClientType(ClientType type) {
    selectedClientType = type;
    // Reset order type to retail when switching client type
    if (selectedClientType == ClientType.individual) {
      selectedOrderType = OrderType.retail;
    }
    // _logger.info('Client type updated to: $selectedClientType');
    emit(
      AddClientState.success(
        message: '',
        selectedClientType: selectedClientType,
      ),
    );
  }

  void updateOrderType(OrderType type) {
    selectedOrderType = type;
    emit(
      AddClientState.success(
        message: '',
        selectedClientType: selectedClientType,
      ),
    );
  }

  void updateCommercialRegistryImage(String? path) {
    commercialRegistryImagePath = path;
    emit(
      AddClientState.success(
        message: '',
        selectedClientType: selectedClientType,
      ),
    );
  }

  void updateResidenceImage(String? path) {
    residenceImagePath = path;
    emit(
      AddClientState.success(
        message: '',
        selectedClientType: selectedClientType,
      ),
    );
  }

  Future<void> addClient() async {
    if (state is Loading || formKey.currentState?.validate() != true) {
      return;
    }

    emit(const AddClientState.loading());
    _logger.info('Adding new client...');

    try {
      final client = Client(
        id: '', // Will be set by repository
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        email: emailController.text.trim().isEmpty
            ? null
            : emailController.text.trim(),
        address: addressController.text.trim().isEmpty
            ? null
            : addressController.text.trim(),
        taxNumber: taxNumberController.text.trim().isEmpty
            ? null
            : taxNumberController.text.trim(),
        type: selectedClientType,
        managerName: managerNameController.text.trim().isEmpty
            ? null
            : managerNameController.text.trim(),
        commercialRegistryImagePath: commercialRegistryImagePath,
        residenceImagePath: residenceImagePath,
        selectedOrderType: selectedOrderType,
      );

      await _repository.addClient(client);
      if (isClosed) return;

      _logger.info('Client added successfully');
      emit(
        const AddClientState.success(
          message: 'تم إضافة العميل بنجاح',
          selectedClientType: ClientType.individual,
        ),
      );

      // Clear form after successful addition
      _clearForm();
    } catch (e) {
      _logger.error('Failed to add client: $e');
      if (!isClosed) {
        emit(
          const AddClientState.error(
            message: 'تعذر حفظ العميل. حاول مرة أخرى.',
          ),
        );
      }
    }
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    taxNumberController.clear();
    managerNameController.clear();
    commercialRegistryImagePath = null;
    residenceImagePath = null;
    selectedClientType = ClientType.individual;
    selectedOrderType = OrderType.retail;
  }

  void resetState() {
    emit(const AddClientState.initial());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    taxNumberController.dispose();
    managerNameController.dispose();
    return super.close();
  }
}
