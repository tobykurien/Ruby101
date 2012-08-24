require 'rubygems'
require 'net/http'
require 'sinatra'
require 'json'

# cache results of call
@@trends = nil

# site root
get '/' do
  # call twitter to get trending topics for South Africa
  # will cache results to class variable to avoid rate-limit issues
  Net::HTTP.start( 'api.twitter.com', 80 ) do |http|
      trends_json = http.get( '/1/trends/23424942.json' ).body
      trends = JSON.parse(trends_json)
      if trends['error']
        # error occurred
        @@trends = "<li>ERROR: #{trends['error']}" 
      else
        # parse the results into HTML
        trends[0]['trends'].each do |trend|
          @@trends += %Q{<li><a href="#{trend['url']}">#{trend['name']}</a></li>}
        end rescue @@trends = "<li>ERROR getting trends: #{$!}</li>"
      end
  end if !@@trends

  # HTML page to return  
  %Q{
  <html>
    <head>
      <title>Twitter fun!</title>
     	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.css" />
	    <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	    <script src="http://code.jquery.com/mobile/1.1.1/jquery.mobile-1.1.1.min.js"></script>
    </head>
    <body>
      <div data-role="page">

	      <div data-role="header">
		      <h1>Twitter Trends</h1>
	      </div><!-- /header -->

	      <div data-role="content">	
          <ul data-role="listview" data-inset="true" data-filter="true">
	          #{@@trends}
          </ul>
	      </div><!-- /content -->
      </div><!-- /page -->
	        
    </body>
  </html>
  }
end
