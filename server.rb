require 'sinatra'

post '/' do
   content_type 'text/xml'
  "<Response><Dial><Number>#{params[:To]}</Number></Dial></Response>"
end