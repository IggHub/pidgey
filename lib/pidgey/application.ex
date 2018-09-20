defmodule Pidgey.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    start_cowboy()
    children = []

    opts = [strategy: :one_for_one, name: Pidgey.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_cowboy do
    route1 = {"/", Pidgey.Web.PageHandler, :home}
    route2 = {"/about", Pidgey.Web.PageHandler, :about}
    route3 = {"/test", Pidgey.Web.PageHandler, :test}
    route4 = {:_, Pidgey.Web.PageHandler, :not_found}

    routes = [{:_, [route1, route2, route3, route4]}]
    dispatch = :cowboy_router.compile(routes)
    opts = [port: 5000]
    env = [dispatch: dispatch]
    :cowboy.start_http(:http, 10, opts, [env: env])
  end
end
