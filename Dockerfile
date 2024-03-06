# Use the latest version of the Rust base image
FROM rust:latest

# Set the working directory in the container to /my
WORKDIR /usr/src/my-app

# Copy the Rust project files to the working directory
COPY . .

RUN cargo build

RUN chmod +x /usr/src/my-app/build-for-web.sh
RUN chmod +x /usr/src/my-app/run_server.sh
RUN chmod +x /usr/src/my-app/entrypoint.sh


ENTRYPOINT ["./entrypoint.sh"]

