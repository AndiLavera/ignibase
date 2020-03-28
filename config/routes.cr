Amber::Server.configure do
  pipeline :web, :auth do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    # plug Amber::Pipe::PoweredByAmber.new
    # plug Amber::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Citrine::I18n::Handler.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    # plug Amber::Pipe::CSRF.new

    plug CurrentUser.new
  end

  pipeline :auth do
    plug Authenticate.new
  end

  pipeline :api_jwt do
    plug AuthenticateJWT.new
  end

  pipeline :api_with_key do
    # plug AuthenticateAPIKey.new
  end

  pipeline :api do
    # plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::CORS.new
  end

  # All static content will run these transformations
  pipeline :static do
    # plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    get "/", ApplicationController, :root
    get "/dashboard/*", ApplicationController, :dashboard
    get "/signup", ApplicationController, :sign_up

    get "/signin", ApplicationController, :sign_in
    post "/session", SessionController, :create

    post "/registration", UserController, :create

    post "/graphql", GraphQLController, :index
    # Passing responsibility of 404 to react router
    # get "/*", ApplicationController, :root
  end

  # Routes for main website
  #
  # Users can sign up, set up dashboard or view documentation
  # with these routes
  routes :api_with_jwt do
    # get "/profile", UserController, :show
    # get "/profile/edit", UserController, :edit
    # patch "/profile", UserController, :update
    # get "/signout", SessionController, :delete
  end

  # Routes for api
  #
  # These are all the endpoints of the service
  routes :api_with_key, "/api/v1" do
    get "/account", AccountController, :index
    post "/account", AccountController, :create

    post "/signup", API::V1::UserController, :create

    post "/session", API::V1::SessionController, :create
  end

  # Serves static files
  routes :static do
    get "/*", Amber::Controller::Static, :index
  end
end
