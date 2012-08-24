require 'rubygems'
require 'net/http'
require 'sinatra'
require 'csv'

# Registration form fragment
def reg_form
  %Q{
    <h2>Enter your details</h2>
    <form name="register" action="/register" method="post">
      <label for="first_name">First name:</label>
      <input type="text" name="first_name" id="basic" data-mini="true" />
      <label for="surname">Surname:</label>
      <input type="text" name="surname" id="basic" data-mini="true" />
	
      <fieldset data-role="controlgroup">
	      <legend>Gender:</legend>
           	<input type="radio" name="gender" id="radio-choice-1" value="Male" checked="checked" />
           	<label for="radio-choice-1">Male</label>

           	<input type="radio" name="gender" id="radio-choice-2" value="Female"  />
           	<label for="radio-choice-2">Female</label>
      </fieldset>
      
      <button type="submit" data-theme="b" name="submit" value="submit-value">Submit</button>
    </form>
  }
end

# returns an array of registered users
def registered_users
  users = []
  CSV.open("user_registration.csv", "r") do |csv|
    users << {
      :first_name => csv[0],
      :surname => csv[1],
      :gender => csv[2]
    }
  end
  users
end

# register form submission
post '/register' do
  # append data to CSV file (CSV object doesn't have append feature so using File instead)
  File.open("user_registration.csv", 'a') do |file|
    file << "#{params[:first_name]},#{params[:surname]},#{params[:gender]}\n"
  end
  redirect "/"
end

# site root
get '/' do
  # HTML page to return  
  %Q{
  <html>
    <head>
      <title>User Registration</title>
     	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.css" />
	    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	    <script src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script>
    </head>
    <body>
      <div data-role="page">

	      <div data-role="header">
		      <h1>Register for our event</h1>
	      </div><!-- /header -->

	      <div data-role="content">	
          #{reg_form}
          <h2>Registered users:</h2>	      
          <ul data-role="listview" data-inset="true" data-filter="true">
            #{registered_users.reduce(""){|html,u| html += "<li>#{u[:surname]}, #{u[:first_name]} - #{u[:gender]}</li>"}}
          </ul>
	      </div><!-- /content -->
      </div><!-- /page -->
	        
    </body>
  </html>
  }
end

