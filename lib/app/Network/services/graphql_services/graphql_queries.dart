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
  query GetPostsByUser {
    getPosts  {
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
        user_name
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

String postFollower = '''
    mutation InsertFollower(\$input: PostFollowerInput!) {
      postFollower(arg1: \$input) {
      
   user_id
   follower_id
      }
    }
  ''';

String getUserById = '''
       query GetUserById(\$input: GetUserByIdInput!) {
  getUserById( arg1: \$input ) {
    email
    image_url
    user_id
    user_name
  }
  }
          ''';

String getAllUsers = '''query GetAllUsers {
  getAllUsers {
    user_id
    email
    image_url
    user_name
  }
}''';

String getAllFollowers = '''
       query GetUserById(\$input: GetFollowerInput!) {
  getAllFollowers( arg1: \$input ) {
    
    
    user_id
    follower_id
  }
  }
          ''';
