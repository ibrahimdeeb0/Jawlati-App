import 'package:jawlati/core/helpers/app_logger.dart';
import '../models/client_model.dart';

abstract class ClientRepository {
  Future<List<Client>> getAllClients();
  Future<Client> addClient(Client client);
  Future<Client> updateClient(Client client);
  Future<void> deleteClient(String clientId);
  Future<Client?> getClientById(String clientId);
}

class ClientRepositoryImpl implements ClientRepository {
  final AppLogger _logger = AppLogger();

  static final List<Client> _clients = [
    Client(
      id: '1',
      name: 'سوبرماركت سلمى وسر',
      phone: '0795551234',
      address: '__ - __',
      type: ClientType.company,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
    Client(
      id: '2',
      name: 'سوبرماركت بس تست',
      phone: '0785559876',
      address: '__ - __',
      type: ClientType.company,
      createdAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    Client(
      id: '3',
      name: 'أحمد محمد',
      phone: '0799123456',
      address: '__ - __',
      type: ClientType.individual,
      balance: 150.0,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  @override
  Future<List<Client>> getAllClients() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _logger.info('Retrieved ${_clients.length} clients');
    return List.from(_clients);
  }

  @override
  Future<Client> addClient(Client client) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final newClient = client.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _clients.add(newClient);
    _logger.info('Added new client: ${newClient.name} (ID: ${newClient.id})');
    return newClient;
  }

  @override
  Future<Client> updateClient(Client client) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final index = _clients.indexWhere((c) => c.id == client.id);
    if (index == -1) {
      throw Exception('Client not found');
    }

    final updatedClient = client.copyWith(updatedAt: DateTime.now());
    _clients[index] = updatedClient;
    _logger.info(
      'Updated client: ${updatedClient.name} (ID: ${updatedClient.id})',
    );
    return updatedClient;
  }

  @override
  Future<void> deleteClient(String clientId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // final removed = _clients.removeWhere((c) => c.id == clientId) > 0;
    // if (!removed) {
    //   throw Exception('Client not found');
    // }

    _logger.info('Deleted client with ID: $clientId');
  }

  @override
  Future<Client?> getClientById(String clientId) async {
    await Future.delayed(const Duration(milliseconds: 200));

    try {
      final client = _clients.firstWhere((c) => c.id == clientId);
      _logger.info('Retrieved client: ${client.name}');
      return client;
    } catch (e) {
      _logger.warning('Client not found with ID: $clientId');
      return null;
    }
  }
}
