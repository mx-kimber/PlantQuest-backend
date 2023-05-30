Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'

    resource '/plants.json',
      headers: :any,
      methods: [:get]
  end
end
