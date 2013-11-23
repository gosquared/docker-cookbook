require_recipe "apt"

bash "docker repo" do
  code %{
    wget -qO- https://get.docker.io/gpg | apt-key add -
    echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
    apt-get update
  }
  not_if "[ -f /etc/apt/sources.list.d/docker.list ]"
end

bash "install docker" do
  code %{
    apt-get install -y lxc-docker
  }
  not_if "dpkg -l | grep docker"
end
