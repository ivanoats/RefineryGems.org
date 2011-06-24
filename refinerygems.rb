get '/' do
  response = <<-EOF
  <!DOCTYPE html>
    <head>
      <title>Refinery Gems</title>
    </head>
    <body>
      <h1>RefineryGems</h1>
      <ul>
  EOF
  # Loop through and print out names of gems and links to their homepage
  Gems.search('refinerycms').each do |g|
    response << "<li><a href=\"#{g['homepage_uri']}\">" + "#{g['name']}" + "</a>"
  end
  response << <<-EOF
      </ul>
      <p>By <a href="http://ivanstorck.com">Ivan Storck</a>
    </body>
  </html>
  EOF
  response
end
