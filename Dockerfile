# Start from the official podinfo image as our base
# This is like saying "start with Ubuntu and podinfo already installed"
FROM stefanprodan/podinfo:6.5.0

# Who maintains this image - good practice to include
LABEL maintainer="avinashgoswami47@gmail.com"

# EXPOSE tells Docker "this container listens on port 9898"
# It's documentation more than anything - doesn't actually open the port
# That's done when you run the container
EXPOSE 9898

# This is the command that runs when container starts
# podinfo is already installed in the base image, we just run it
ENTRYPOINT ["./podinfo"]
