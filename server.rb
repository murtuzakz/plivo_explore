require 'sinatra'

post '/' do
   content_type 'text/xml'
   wrap_in_response do 
    dial_builder(params[:To])
   end
end

def dial_builder(phone_number)
  "<Dial>\
    <Number>\
      #{params[:To]}\
    </Number>\
  </Dial>"
end

def wrap_in_response
  "<Response>" + yield + "</Response>"
end