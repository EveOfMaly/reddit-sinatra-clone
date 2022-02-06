interesting = Sub.create(title: "Damn, that's interesting!", description: "The most interesting place on reddit", url: "https://www.reddit.com/r/Damnthatsinteresting/")
psych = Sub.create(title: "psychology", description: "A Reddit community for sharing and discussing science-based psychological material.", url: "https://www.reddit.com/r/Damnthatsinteresting/")
startup = Sub.create(title: "Web Startup", description: "Startups")

john = User.create(username: "Malysreix", password: "pass")
james = User.create(username: "JamMAlsdes", password: "")
bob = User.create(username: "BobMassa",  password: "cash")
john.subs << interesting
james.subs << psych 
bob.subs << interesting 

Post.create(title: "Post 1")
Post.create(title: "Post 2")
Post.create(title: "Post 4")
Post.create(title: "Post 4")

