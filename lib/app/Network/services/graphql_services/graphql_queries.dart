// String getNewsFeedByPersonId = r'''
//        query GetPostsByUserId($user_id: String!) {
//   posts(query: { user_id: $user_id }) {
//     _id
//     created_at
//     image_url
//     text
//     user_id
//   }
// }
//            ''';
const String getNewsFeedByPersonId = '''
  query GetPostsByUser(\$input: PostUserInput!) {
    getPostsByUser(arg1: \$input) {
      user_id
      text
      created_at
      image_url
    }
  }
''';

String createUser = '''
    mutation InsertUser(\$input: UserInput!) {
      insertOneUser(arg1: \$input) {
        _id
        email
        image_url
        user_id
        userName
      }
    }
  ''';

String addNewsFeed = '''
    mutation InsertPost(\$input: PostInput!) {
      insertOnePost(arg1: \$input) {
      
      created_at
      image_url
      text
      user_id
      created_at
      }
    }
  ''';

String getUserById = r'''
       query GetUserById($user_id: String!) {
  user(query: { user_id: $user_id }) {
    _id
    email
    image_url
    userName
  }
  }
          ''';

String getAllUsers = r'''query GetAllUsers {
  users {
    _id
    email
    image_url
    userName
  }
}''';
