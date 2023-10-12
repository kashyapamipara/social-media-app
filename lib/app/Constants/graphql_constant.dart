import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:social_media_app/app/Constants/app_strings.dart';


GraphQLClient getClient() {
  return GraphQLClient(
    link: HttpLink(
      defaultHeaders: requestHeader,
      AppStrings.graphQLUrl, // Replace with your Hasura API URL
    ),
    cache: GraphQLCache(store: InMemoryStore()),
  );
  ;
}

final requestHeader = {
  "content-type": "application/json",
  "x-hasura-admin-secret": AppStrings.graphQLSecret
};
