require 'sinatra'

class App < Sinatra::Base

  # Add this line to set the Content-Type header for all responses
  set :default_content_type, "application/json"

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end
  
  get '/potato' do
    "<p> Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get "/dice" do
    # generate JSON data by using .to_json method to convert RUBY# or array to a valid JSON string
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json
  end

  get "/add/1/2" do
    sum = 1 + 2
    { result: sum }.to_json
  end

  # By defining our route with this special syntax, any requests that match the pattern /add/:num1/:num2 will result in this route being used.
  # So making a request to /add/1/2 will use this route, and so will /add/2/5
  get "/add/:num1/:num2" do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

end

run App
