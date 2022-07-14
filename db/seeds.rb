#Users creaton
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

#Posts Creation
first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: first_user.id, title: 'Alert', text: 'Due date is tomorrow')
third_post = Post.create(author_id: second_user.id, title: 'Hi', text: 'The work is done')
forth_post = Post.create(author_id: second_user.id, title: 'Kudos', text: 'All passed')

#Comments creation
comment = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
comment_two = Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'how is the day going!' )
comment_three = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'all good!' )
comment_four = Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'that is nice!' )
comment_five = Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'See ya!' )
comment_six = Comment.create(post_id: first_post.id, author_id: first_user.id, text: 'Good bye!' )
