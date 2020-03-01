# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "sous" {
  image = "${docker_image.react-app.latest}"
  name  = "sous"
  ports {
    internal = 8100
	external = 8100
  }
}

resource "docker_image" "react-app" {
  name = "react-app:alpha"
}