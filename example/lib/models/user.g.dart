// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User email(String email);

  User id(String id);

  User name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    String? email,
    String? id,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User email(String email) => this(email: email);

  @override
  User id(String id) => this(id: id);

  @override
  User name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? email = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return User(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfUser.copyWith(...)` or like so:`instanceOfUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}

// **************************************************************************
// ElementWidgetGenerator
// **************************************************************************

class UserWidget extends StatefulWidget {
  final User element;

  const UserWidget(this.element, {Key? key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  final GlobalKey<StringWidgetState> idWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> nameWidgetKey =
      GlobalKey<StringWidgetState>();
  final GlobalKey<StringWidgetState> emailWidgetKey =
      GlobalKey<StringWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StringWidget(
              key: idWidgetKey,
              fieldName: "id",
              fieldDescription: "This is the id",
              editable: false,
              placeholder: "Type the id",
              value: widget.element.id,
            ),
            StringWidget(
              key: nameWidgetKey,
              fieldName: "name",
              fieldDescription: "This is the name",
              editable: true,
              placeholder: "Type the name",
              value: widget.element.name,
            ),
            StringWidget(
              key: emailWidgetKey,
              fieldName: "email",
              fieldDescription: "This is the email",
              editable: true,
              placeholder: "Type the email",
              value: widget.element.email,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? updatedid = idWidgetKey.currentState?.getUpdatedValue();

          String? updatedname = nameWidgetKey.currentState?.getUpdatedValue();

          String? updatedemail = emailWidgetKey.currentState?.getUpdatedValue();

          User updatedUser = widget.element
              .copyWith(id: updatedid, name: updatedname, email: updatedemail);
          var container = ProviderContainer();
          try {
            await container.read(updateUserProvider(updatedUser));
            print('User updated successfully');
          } catch (error) {
            print('Failed to update User: $error');
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

// **************************************************************************
// HomeWidgetElementGenerator
// **************************************************************************

class UserHomeWidget extends StatelessWidget {
  const UserHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserListView()),
        );
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blue, // You can choose any color you like
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/user.png',
              width: 40.0,
              height: 40.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "User",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

// **************************************************************************
// ListWidgetGenerator
// **************************************************************************

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationState = ref.watch(userPaginationProvider);
    final usersAsyncValue = ref.watch(getAllUserProvider(paginationState));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: usersAsyncValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (List<User> users) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                      columns: const [
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                        DataColumn(
                          label: Expanded(
                              child: Text(
                            'email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 54, 54)),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ],
                      rows: users.map((user) {
                        return DataRow(
                          cells: [
                            DataCell(Center(child: Text(user.name.toString()))),
                            DataCell(
                                Center(child: Text(user.email.toString()))),
                          ],
                          onSelectChanged: (selected) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserWidget(user)),
                            );
                          },
                        );
                      }).toList(),
                      showCheckboxColumn: false)));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                ref.read(userPaginationProvider.notifier).decrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () =>
                ref.read(userPaginationProvider.notifier).incrementPage(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 224, 221, 221),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}

class UserPaginationNotifier extends StateNotifier<Tuple2<int, int>> {
  UserPaginationNotifier() : super(const Tuple2<int, int>(0, 10));

  void incrementPage() => state = Tuple2(state.item1 + 10, state.item2);
  void decrementPage() {
    if (state.item1 != 0) {
      state = Tuple2(state.item1 - 10, state.item2);
    }
  }
}

final userPaginationProvider =
    StateNotifierProvider<UserPaginationNotifier, Tuple2<int, int>>(
  (ref) => UserPaginationNotifier(),
);

// **************************************************************************
// RiverpodCustomGenerator
// **************************************************************************

final getUserProvider =
    FutureProvider.autoDispose.family<User, int>((ref, userId) async {
  final json = await http.get(Uri.parse('$baseURL/users/$userId'));
  final jsonData = jsonDecode(json.body);
  return User.fromJson(jsonData);
});

final createUserProvider =
    FutureProvider.autoDispose.family<void, User>((ref, userInstance) async {
  final response = await http.post(
    Uri.parse('$baseURL/users'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(userInstance.toJson()),
  );
  if (response.statusCode != 201) {
    throw Exception('Failed to create User');
  }
});

final updateUserProvider =
    FutureProvider.autoDispose.family<void, User>((ref, userInstance) async {
  final response = await http.put(
    Uri.parse('$baseURL/users/${userInstance.id}'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(userInstance.toJson()),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update User');
  }
});

final deleteUserProvider =
    FutureProvider.autoDispose.family<void, int>((ref, userId) async {
  final response = await http.delete(
    Uri.parse('$baseURL/users/$userId'),
  );
  if (response.statusCode != 204) {
    throw Exception('Failed to delete User');
  }
});

final getAllUserProvider = FutureProvider.autoDispose
    .family<List<User>, Tuple2<int, int>>((ref, tuple) async {
  final json = await http.get(
      Uri.parse('$baseURL/users?skip=${tuple.item1}&limit=${tuple.item2}'));
  final jsonData = jsonDecode(json.body) as List;
  return jsonData.map((data) => User.fromJson(data)).toList();
});