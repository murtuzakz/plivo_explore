require 'sinatra'

post '/' do
   content_type 'text/xml'
   wrap_in_response do 
    dial_builder(params[:To]) + recorder(params[:Record])
   end
end

post '/record' do
end

def dial_builder(phone_number)
  "<Dial>\
    <Number>\
      #{params[:To]}\
    </Number>\
  </Dial>"
end

def recorder(to_record)
  if to_record
    "<Record action='#{request.env['HTTP_HOST']}/record'></Record>"
  end
end

def wrap_in_response
  "<Response>" + yield + "</Response>"
end