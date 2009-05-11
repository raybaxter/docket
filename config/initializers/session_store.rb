# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_docket_session',
  :secret      => '98776431c6d1a11d504970853ee13aa96acb516e80c6e003796d17eb30ab98658e1a277e4b3411de9e45ffb77b35f0158aab19f22fb31b934fffe4de8c04eb37'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
