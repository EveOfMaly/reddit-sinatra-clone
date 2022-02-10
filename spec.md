# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    - See ActiveRecord Assocatiosn in the Model and Controller 
- [x] Include more than one model class (e.g. User, Post, Category)
       -  Model class are User, Post, Sub, and PostSub as the Join.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        - Post has many subs through Post Subs

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      - 
    Associations  
    User 
     A user has many POST *
     A user many SUBS 

    Sub
    A Sub belongs to a Post *
    A Sub has many Posts through PosTSubs 
      Has many Post Subs*

    Post 
    A Post belongs to a User *
    A Post Has many Subs*
    Has many Post Subs*


- [x] Include user accounts with unique login attribute (username or email)
      - patch '/users/:slug' && post '/users' have user accounts with unique login attribute of username.
      - No other user can use the same username whether in creation or update a user.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - PostController, SubController, & UserController each have CRUD routes. 
- [x] Ensure that users can't modify content created by other users
         - Users can only modify Subs or Post that they create 
- [x] Include user input validations
    - Post, User, Subs cannot have empty items. Redirects the user.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
     - Used Rack::Flash to show processes to the user.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message