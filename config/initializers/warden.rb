Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.failure_app = proc do |_env|
    ['401', { 'Content-Type' => 'application/json' }, { error: 'Unauthorized', code: 401 }]
  end
  manager.default_strategies :password # needs to be defined
  # Optional Settings (see Warden wiki)
  # manager.scope_defaults :admin, strategies: [:password]
  # manager.default_scope = :admin # optional default scope
  # manager.intercept_401 = false # Warden will intercept 401 responses, which can cause conflicts
end