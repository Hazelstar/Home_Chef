require 'stripe'

Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# Create a standard account and prefill information
account = Stripe::Account.create({
  type: 'standard',
})

# # Create an account link
# account_links = Stripe::AccountLink.create({
#   account: 'acct_1032D82eZvKYlo2C',
#   refresh_url: 'https://example.com/reauth',
#   return_url: 'https://example.com/return',
#   type: 'account_onboarding',
# })
