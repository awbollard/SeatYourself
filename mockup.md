index
log in/sign up OR "hello, #{user}!"
restaurant list (just name w/ link)

restaurant profile
log in/sign up OR "hello, #{user}!"
shows information (name, hours (standardized), capacity (standardized), address, nbhd, price, description, menu, photo)
drow down for reservation (party size/date/time) - once submit is clicked, taken to login page
if user is logged in & owner, restaurant can be deleted

log in page
(did you mean sign up?)
form: email
	  password
submit -> fail, "There was an error in the form entry"
		  success, redirects to last page

sign up page
(did you mean log in?)
form: first name, last name
	  email
	  username
	  password
	  password again
submit -> fail, "There was an error in the form entry"
		  success, redirects to log in

(if logged in) new restaurant/edit restaurant
Form: Needs: Name, address, hours, capacity
	  Possible: nbhd, price, description, menu, photo
submit -> fail, "There was an error in the form entry"
		  success, redirects to profile landing

Profile Landing
Displays owned restaurants, if any
	Edit option (takes you to the edit/new restaurant page)
	Delete option ("Are you sure?" Y/N)
Displays reservations, if any
	Edit option (takes you to restaurant page with filled in drop down)
	Delete option ("Are you sure?" Y/N)

Reservation Verification
"Are you sure you want a reservation for #{party size} on #{date} at #{time}?"
	Yes -> Profile Landing
	No -> Restaurant page with previous reservation in the drop down