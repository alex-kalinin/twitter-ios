Complex Twitter Client
===========

Time spent: 3h

### Implemented User Stories
###### Required - (minus one)
* Hamburger menu
 * Dragging anywhere in the view should reveal the menu.
 * The menu should include links to your profile, the home timeline, and the mentions view.
 * The menu can look similar to the LinkedIn menu below or feel free to take liberty with the UI.
* Profile page
 * Contains the user header view


### Project Requirements
* Home Timeline
 * Tapping on a user image should bring up that user's profile page
* Profile page
 * Contains a section with the users basic stats: # tweets, # following, # followers
 * Optional: Implement the paging view for the user description.
 * Optional: As the paging view moves, increase the opacity of the background screen. See the actual Twitter app for this effect
 * Optional: Pulling down the profile page should blur and resize the header image.

* Optional: Account switching
 * Long press on tab bar to bring up Account view with animation
 * Tap account to switch to
 * Include a plus button to Add an Account
 * Swipe to delete an account


Simple Twitter Client
===========

Time spent: 15h.


## Walkthrough
![Video Walkthrough](twitter-walkthrough.gif)

### Implemented stories
###### Required - all
* User can sign in using OAuth login flow
* User can view last 20 tweets from their home timeline
* The current signed in user will be persisted across restarts
* In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp. In other words, design the custom cell with the proper Auto Layout settings. You will also need to augment the model classes.
* User can pull to refresh
* User can compose a new tweet by tapping on a compose button.
* User can tap on a tweet to view it, with controls to retweet, favorite, and reply.

###### Optional 
* Optional: After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
* Optional: Retweeting and favoriting should increment the retweet and favorite count.
* Optional: User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
* Optional: When composing, you should have a countdown in the upper right for the tweet limit.
* Optional: Replies should be prefixed with the username and the reply_id should be set when posting the tweet,


### REMAIN

###### Optional 

* Optional: User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.

### References

1. http://courses.codepath.com/courses/intro_to_ios/week/3#!assignment
2. Free iOS icons: http://www.glyphish.com/
