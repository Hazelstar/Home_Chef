# require 'stripe'
# require 'sinatra'
# require 'dotenv'

# Rails.configuration.stripe = {
#   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
#   secret_key:      ENV['STRIPE_SECRET_KEY']
# }

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

# # Create a standard account and prefill information
# # account = Stripe::Account.create({
# #   type: 'standard',
# # })

# # # Create an account link
# # account_links = Stripe::AccountLink.create({
# #   account: 'acct_1032D82eZvKYlo2C',
# #   refresh_url: 'https://example.com/reauth',
# #   return_url: 'https://example.com/return',
# #   type: 'account_onboarding',
# # })

# enable :sessions
# set :static, true
# set :public_folder, File.join(File.dirname(__FILE__), ENV['STATIC_DIR'])
# set :port, 4242

# helpers do
#   def request_headers
#     env.each_with_object({}) { |(k, v), acc| acc[Regexp.last_match(1).downcase] = v if k =~ /^http_(.*)/i; }
#   end
# end

# get '/' do
#   content_type 'text/html'
#   send_file File.join(settings.public_folder, 'index.html')
# end

# post '/onboard-user' do
#   content_type 'application/json'

#   account = Stripe::Account.create({
#     type: 'standard',
#     email: current_user.email,
#     capabilities: {
#       card_payments: {requested: true},
#       transfers: {requested: true},
#     },
#   })

#   session[:account_id] = account.id

#   origin = request_headers['origin']

#   account_link = Stripe::AccountLink.create(
#     type: 'account_onboarding',
#     account: account.id,
#     refresh_url: "#{origin}/onboard-user/refresh",
#     return_url: "#{origin}/success.html"
#   )

#   {
#     url: account_link.url
#   }.to_json
# end

# get '/onboard-user/refresh' do
#   redirect '/' if session[:account_id].nil?

#   account_id = session[:account_id]
#   origin = "http://#{request_headers['host']}"

#   account_link = Stripe::AccountLink.create(
#     type: 'account_onboarding',
#     account: account_id,
#     refresh_url: "#{origin}/onboard-user/refresh",
#     return_url: "#{origin}/success.html"
#   )

#   redirect account_link.url
# end
