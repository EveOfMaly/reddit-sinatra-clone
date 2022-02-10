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
     A user has many POST 
     A user many SUBS 

    Sub
    A Sub belongs to a Post 
    A Sub has many Posts through PosTSubs 
      Has many Post Subs

    Post 
    A Post belongs to a User 
    A Post Has many Subs
    Has many Post Subs


