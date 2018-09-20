defmodule Pidgey.Web.Router do
  def call(path) do
    content_for(path)
  end

  defp content_for(path) do
    "<h1>#{path} Page</h1>"
  end

  defp content_for(_) do
    "<h1>404 ERROR</h1>"
  end
end
