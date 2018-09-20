defmodule Pidgey.Web.PageHandler do
  def init({:tcp, :http}, req, _opts) do
    {:ok, req, :nostate}
  end

  def handle(req, _state) do
    headers = [{"content-type", "text/html"}]
    {path, req} = :cowboy_req.path(req)
    {:ok, resp} = :cowboy_req.reply(200, headers, content_for(path), req)
    {:ok, resp, :nostate}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end

  defp content_for("/home") do
    "<h1>Home Page</h1>"
  end

  defp content_for("/about") do
    "<h1>About Page</h1>"
  end

  defp content_for("/test") do
    "<h1>Test page</h1>"
  end

  defp content_for(_) do
    "<h1>ERROR</h1>"
  end
end
