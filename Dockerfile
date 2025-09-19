# Use a lightweight base image
FROM ubuntu:latest

# Install required packages (cowsay, fortune, netcat for serving)
RUN apt-get update && \
    apt-get install -y cowsay fortune-mod netcat-openbsd socat && \
    rm -rf /var/lib/apt/lists/*

# Add the path
ENV PATH="${PATH}:/usr/games"

# Copy the wisecow script into the container
WORKDIR /app
COPY wisecow.sh .

# Make it executable
RUN chmod +x wisecow.sh

# Expose the port the app listens on
EXPOSE 4499

# Run the script when the container starts
CMD ["./wisecow.sh"]
