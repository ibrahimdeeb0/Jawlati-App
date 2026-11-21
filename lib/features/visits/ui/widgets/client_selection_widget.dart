import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/di/dependency_injection.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import 'package:jawlati/features/clients/data/repo/client_repository.dart';

class ClientSelectionWidget extends StatelessWidget {
  final Client? selectedClient;
  final ValueChanged<Client?> onClientSelected;

  const ClientSelectionWidget({
    super.key,
    required this.selectedClient,
    required this.onClientSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showClientSelection(context),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedClient != null
                ? AppColors.mainBlue
                : AppColors.borderGray,
            width: selectedClient != null ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: selectedClient != null
            ? _buildSelectedClient()
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildSelectedClient() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mainBlue.withOpacity(0.1),
          radius: 20,
          child: Icon(
            selectedClient!.type == ClientType.company
                ? Icons.business
                : Icons.person,
            color: AppColors.mainBlue,
            size: 20,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedClient!.name,
                style: AppTextStyles.body16DarkBlueSemiBold,
              ),
              if (selectedClient!.address != null) ...[
                SizedBox(height: 4.h),
                Text(
                  selectedClient!.address!,
                  style: AppTextStyles.caption12GrayMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
        Icon(Icons.check_circle, color: AppColors.mainBlue, size: 24),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.gray.colorWithOpacity(0.1),
          radius: 20,
          child: Icon(Icons.person_add, color: AppColors.gray, size: 20),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            'اختر عميل للزيارة',
            style: AppTextStyles.body14GrayRegular,
          ),
        ),
        Icon(Icons.keyboard_arrow_down, color: AppColors.gray, size: 24),
      ],
    );
  }

  void _showClientSelection(BuildContext context) {
    AppBottomSheet.showModal(
      context: context,
      title: 'اختر عميل للزيارة',
      content: _ClientSelectionContent(
        selectedClient: selectedClient,
        onClientSelected: onClientSelected,
      ),
    );
  }
}

class _ClientSelectionContent extends StatefulWidget {
  final Client? selectedClient;
  final ValueChanged<Client?> onClientSelected;

  const _ClientSelectionContent({
    required this.selectedClient,
    required this.onClientSelected,
  });

  @override
  State<_ClientSelectionContent> createState() =>
      _ClientSelectionContentState();
}

class _ClientSelectionContentState extends State<_ClientSelectionContent> {
  final _searchController = TextEditingController();
  late Future<List<Client>> _clients;

  @override
  void initState() {
    super.initState();
    _clients = getIt<ClientRepository>().getAllClients();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        constraints: BoxConstraints(maxHeight: 0.7.sh),
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            // شريط البحث
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'ابحث عن عميل...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // قائمة العملاء
            Expanded(
              child: FutureBuilder<List<Client>>(
                future: _clients,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: TextButton(
                        onPressed: () => setState(() {
                          _clients = getIt<ClientRepository>().getAllClients();
                        }),
                        child: const Text('تعذر تحميل العملاء. أعد المحاولة'),
                      ),
                    );
                  }

                  final query = _searchController.text.trim().toLowerCase();
                  final clients = snapshot.requireData
                      .where(
                        (client) =>
                            client.isActive &&
                            (client.name.toLowerCase().contains(query) ||
                                client.phone.contains(query) ||
                                (client.address?.toLowerCase().contains(
                                      query,
                                    ) ??
                                    false)),
                      )
                      .toList();

                  if (clients.isEmpty) return _buildEmptyState();
                  return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final client = clients[index];
                      final isSelected = widget.selectedClient?.id == client.id;

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.mainBlue.withOpacity(0.1),
                          child: Icon(
                            client.type == ClientType.company
                                ? Icons.business
                                : Icons.person,
                            color: AppColors.mainBlue,
                          ),
                        ),
                        title: Text(client.name),
                        subtitle: client.address != null
                            ? Text(client.address!)
                            : null,
                        trailing: isSelected
                            ? Icon(
                                Icons.check_circle,
                                color: AppColors.mainBlue,
                              )
                            : null,
                        onTap: () {
                          widget.onClientSelected(client);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: AppColors.gray),
          SizedBox(height: 16.h),
          Text('لا توجد نتائج', style: AppTextStyles.body16DarkBlueSemiBold),
          SizedBox(height: 8.h),
          Text('جرب كلمة بحث أخرى', style: AppTextStyles.caption12GrayMedium),
        ],
      ),
    );
  }
}
