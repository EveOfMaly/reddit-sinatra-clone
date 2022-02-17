Reddit Clone Notes
1. Models
    User
        Username
        URL
        Cakeday
        Karma Score
    Community 
        Title
        URL
        Description
        Moderator  - Creator of the sub
        # of members
        #created_date


    Post
        Title
        Description
        Link
        Content
        Author
    
    Bonus


2. Associations  
    User 
     A user has many Posts
     A user many Subs 

    Sub
    A Sub belongs to a User 
    A Sub has many Posts through Postsubs 
    A Sub has has many Postsubs

    Post 
    A Post belongs to a User 
    A Post has many Postsubs
    Has many Subs through Postsubs 


