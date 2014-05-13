OmniAuth.config.logger = Rails.logger
 
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '334800337065.apps.googleusercontent.com', 'VpMsJb97RUcspXYhzbs9P6xu', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end