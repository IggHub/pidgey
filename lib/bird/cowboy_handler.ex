defmodule Bird.CowboyHandler do
  def init({:tcp, :http}, req, router) do
    {:ok, req, router}
  end

  def handle(req, router) do
    headers = [{"content-type", "text/html"}]
    {path, req} = :cowboy_req.path(req)

    body = router.call(path)
    {:ok, resp} = :cowboy_req.reply(200, headers, body, req)
    {:ok, resp, router}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end
end
