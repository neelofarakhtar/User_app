# create a new follow relationship where the user 
# with the id of 1 follows the user with the id of 2 
Follow.create(follower_id: 1, following_id: 2)
# create another for good measure with a different user
Follow.create(follower_id: 1, following_id: 3)
# Now, let's create a relationship where the user with 
# the id of 1 is being followed by a user with the 
# id of 3
Follow.create(follower_id: 3, following_id: 1)
# Now, let's see how our relationships work.  First, 
# find the user who we created relationships for.
u = User.find 1
# List this user's followers
u.followers
# List the users this user is following
u.following
# calling follower_relationships on the user will list 
# the relationships we've created in the follows table
# where the user is being followed by other users
u.follower_relationships
# calling following_relationships on the user will list
# the relationships we've created in the follows table 
# where the user is following other users
u.following_relationships