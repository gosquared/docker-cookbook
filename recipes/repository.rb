
bash "Set up docker repo" do
  code %{
    docker run -p 5000 stackbrew/registry
  }
end
