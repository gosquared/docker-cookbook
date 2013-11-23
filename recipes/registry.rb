
bash "Set up docker registry" do
  code %{
    docker run -p #{node[:registry][:port_map]} -d=true #{node[:registry][:registry_container]}
  }
  not_if "docker ps | grep #{node[:registry][:registry_container]}"
end
