interesting = Sub.create(sub_title: "Damn, that's interesting!", sub_description: "The most interesting place on reddit", sub_url: "https://www.reddit.com/r/Damnthatsinteresting/")
psych = Sub.create(sub_title: "psychology", sub_description: "A Reddit community for sharing and discussing science-based psychological material.", sub_url: "https://www.reddit.com/r/Damnthatsinteresting/")
startup = Sub.create(sub_title: "Web Startup", sub_description: "Startups")

john = User.create(user_username: "John")
james = User.create(user_username: "James")
bob = User.create(user_username: "Bob")

john.subs << interesting
james.subs << psych 
bob.subs << interesting 

