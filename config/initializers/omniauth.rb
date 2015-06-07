# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
       provider :developer unless Rails.env.production?
       provider :github, ENV["github_client_id"], ENV["github_secret"], scope: "user:email"
       provider :facebook, ENV["facebook_client_id"], ENV["facebook_secret"]
       #provider :google_oauth2, ENV["google_client_id"], ENV["google_secret"]
       #provider :github, "d414bc86279eaaa5af0d", "e64915bfa56ec49a511e68eac332b92913c9bcf5"
       #provider <name, <clien id>, 	<client secret>
end