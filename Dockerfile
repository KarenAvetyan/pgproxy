# Build stage
FROM gcc:latest AS builder

# Copy source code
COPY src/* /app/

# Build the code
WORKDIR /app
RUN make

# Runtime stage
ARG IMAGE
FROM ${IMAGE}

# Copy the pgproxy executable to the container
COPY --from=builder /app/pgproxy /usr/local/bin/pgproxy

# Set the appropriate permissions for the pgproxy executable
RUN chmod +x /usr/local/bin/pgproxy

# Expose the listen port
ENV LISTEN_PORT=${LISTEN_PORT:-6432}
ENV POSTGRES_HOST=${POSTGRES_HOST:-localhost}
ENV POSTGRES_PORT=${POSTGRES_PORT:-5432}
EXPOSE ${LISTEN_PORT}

# Set the entrypoint to the pgproxy executable
ENTRYPOINT ["/bin/sh", "-c", "/usr/local/bin/pgproxy $LISTEN_PORT $POSTGRES_HOST $POSTGRES_PORT"]