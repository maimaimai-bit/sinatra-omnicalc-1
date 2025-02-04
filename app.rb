require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

# Square routes
get("/square/new") do
  erb(:square_form)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number ** 2
  
  erb(:square_results)
end

# Square root routes
get("/square_root/new") do
  erb(:square_root_form)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @square_root = Math.sqrt(@number)
  
  erb(:square_root_results)
end

# Random routes
get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random = rand(@min..@max)
  
  erb(:random_results)
end

# Payment routes
get("/payment/new") do
  erb(:payment_form)
end

get("/payment/results") do
  apr = params.fetch("user_apr").to_f
  years = params.fetch("user_years").to_i
  principal = params.fetch("user_principal").to_f
  
  # Convert APR to monthly rate (APR/12/100)
  @rate = (apr / 100.0).round(4)
  r = @rate / 12
  
  # Convert years to months
  n = years * 12
  
  # Calculate payment using the formula: P = (r*PV)/(1-(1+r)^-n)
  # Where: r = monthly rate, PV = principal value, n = total number of months
  numerator = r * principal
  denominator = 1 - ((1 + r) ** -n)
  @payment = (numerator / denominator).round(2)
  
  erb(:payment_results)
end
