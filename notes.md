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
        *Anon profile views*

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
     A user many SUBS through POST

    Sub
    A Sub has many Post 
    A Sub has many Users through Post 

    Post 
    A Post belongs to a User 
    A Post belongs to a Community


