import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

class NetworkService {
  NetworkService();

  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, seddo elusmod tempor incididunt ut labore et dolore magnaaliqua. Ut enim ad minim veniam, quis nostrud exercitationullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit essecillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description: 'Description: Check latest news on Flutter',
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description: 'Description: Have a call with Flutter team',
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description: 'Description: Work on application performance',
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description: 'Description: Plan work for next week',
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description: 'Description: Order lunch',
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description: 'Description: Create an invoice for last month',
      ),
    ];
  }
}
