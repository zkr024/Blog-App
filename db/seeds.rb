first_user = User.create(name: 'Tom', bio: 'Teacher from Mexico.', photo: 'https://images.unsplash.com/photo-1542309667-2a115d1f54c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80', email: 'tom@test.com', password: 'password', password_confirmation: 'password')
second_user = User.create(name: 'Lilly', bio: 'Teacher from Poland.', photo: 'https://images.unsplash.com/photo-1614283233556-f35b0c801ef1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', email: 'lili@test.com', password: 'password', password_confirmation: 'password')
third_user = User.create(name: 'Adriana', bio: 'psychologist from Colombia', photo: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', email: 'adri@test.com', password: 'password', password_confirmation: 'password', role: 'admin')


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
