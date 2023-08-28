# Use a base image
FROM alpine:latest

# Copy a file from the host into the image
COPY hello.txt  /app/hello.txt

# Set the working directory
WORKDIR /app

# Specify a command to run when the container starts
CMD ["cat", "hello.txt"]
