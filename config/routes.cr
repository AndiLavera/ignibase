Amber::Server.configure do
  pipeline :web do
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

  # This pipeline is used for the front facing
  # website & documentation. After a user signs in
  # and moves to the dashboard, they move to the
  # `:api_jwt` pipeline
  pipeline :public_api, :api_with_jwt, :api_with_key do
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::CORS.new
  end

  # This pipeline verifies a user's session via JWT.
  # Specifically used for authenticated areas of the website
  # such as the dashboard
  pipeline :api_with_jwt do
    plug AuthenticateJWT.new
  end

  # This pipeline is for the front facing api.
  # User requests are verified via api keys.
  pipeline :api_with_key do
    plug AuthenticateAPIKey.new
  end

  # All static content will run these transformations
  pipeline :static do
    # plug Amber::Pipe::PoweredByAmber.new
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :web do
    # Reroutes to react-router
    get "/", ApplicationController, :root
    get "/dashboard/*", ApplicationController, :root
    get "/signup", ApplicationController, :root
    get "/signin", ApplicationController, :root
  end

  routes :public_api, "/api" do
    post "/signup", API::UserController, :create
    post "/session", API::SessionController, :create
  end

  # Routes for main website
  #
  # Users can sign up, set up dashboard or view documentation
  # with these routes
  routes :api_with_jwt, "/api" do
    # get "/profile", UserController, :show
    # get "/profile/edit", UserController, :edit
    # patch "/profile", UserController, :update
    # get "/signout", SessionController, :delete

    post "/apps", API::JWT::AppController, :index
    post "/apps/create", API::JWT::AppController, :create

    post "/api_key/create", API::JWT::APIKeysController, :create
    post "/api_key", API::JWT::APIKeysController, :index
  end

  # Routes for api
  #
  # These are all the endpoints of the service
  routes :api_with_key, "/api/v1" do
    get "/account", API::V1::AccountController, :show
    post "/account", API::V1::AccountController, :create
  end

  routes :api_with_key, "/api" do
    post "/graphql", API::GraphQLController, :index
  end

  # Serves static files
  routes :static do
    get "/*", Amber::Controller::Static, :index
  end
end
