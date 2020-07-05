# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "react-app" {
  image = "${docker_image.react-app.latest}"
  name  = "react-app"
  ports {
    internal = 8100
	external = 8100
  }
}

resource "docker_image" "react-app" {
  name = "react-app:alpha"
}
