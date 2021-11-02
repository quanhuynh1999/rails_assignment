# Assignment Ruby On Rails
## Create 2 entities:

- User: email, encrypted_password, first name, last name, created time, updated time
- Activity: message, created time, updated time


## Expected API:
- 
- **Register API**: Email and password are required. If missing required info, return 400. Also, return 400, if user already exists.
- **Login API**. Email and password are required. If missing required info, return 400. If wrong user name/password, return 401.
- User can post an activity. Activity entity has created time, updated time and message.
- User A can follow/unfollow user B. Return 400 error if user A follow himself, follow user he already followed. Returns 404 if user B does not exist.
- User can fetch all and a paginated activities of his activities. If total activties bigger than 10, only returns the first 10.
- User can fetch all or paginated activities of his followed users. If total activties bigger than 10, only returns the first 10.
