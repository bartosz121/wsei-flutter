import 'package:flutter/material.dart';
import 'package:wsei_flutter/models/person_detail.dart';
import 'package:wsei_flutter/services/api_service.dart';

class PersonDetailsView extends StatefulWidget {
  final int personId;

  const PersonDetailsView({Key? key, required this.personId}) : super(key: key);

  @override
  _PersonDetailsViewState createState() => _PersonDetailsViewState();
}

class _PersonDetailsViewState extends State<PersonDetailsView> {
  final api = ApiService();
  late Future<PersonDetail> _personDetail;

  @override
  void initState() {
    super.initState();
    _personDetail = _fetchPersonDetails();
  }

  Future<PersonDetail> _fetchPersonDetails() async {
    return await api.getPersonDetails(widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Details'),
      ),
      body: FutureBuilder(
        future: _personDetail,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final PersonDetail personDetail = snapshot.data;

          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${personDetail.profilePath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        personDetail.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        personDetail.birthday ?? '',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Biography',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            personDetail.biography ?? '',
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
