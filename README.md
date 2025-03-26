# pgproxy

A lightweight PostgreSQL proxy server written in C++ that enables monitoring and logging of SQL queries.

This project was originally based on the existing [repository](https://github.com/Hasuk1/Proxy-Server-with-logging-SQL-queries).

## Features

- Forwards PostgreSQL connections between client and server
- Logs SQL queries with timestamp and client information
- Supports multiple simultaneous client connections
- Configurable proxy port, backend host, and port

## Prerequisites

- C++17 compatible compiler
- Make build system
- Docker (optional)

## Building from Source

```bash
cd src
make
```

## Usage

### Running directly

```bash
./pgproxy <proxy_port> <backend_host> <backend_port>
```

Example:
```bash
./pgproxy 6432 localhost 5432
```

### Using Docker

Pull the image:
```bash
docker pull karenavetyan/pgproxy:latest
```

Run the container:
```bash
docker run -p 6432:6432 \
  -e LISTEN_PORT=6432 \
  -e POSTGRES_HOST=localhost \
  -e POSTGRES_PORT=5432 \
  karenavetyan/pgproxy:latest
```

## Environment Variables

When using Docker, the following environment variables are available:

- `LISTEN_PORT`: Port on which pgproxy listens (default: 6432)
- `POSTGRES_HOST`: PostgreSQL server host (default: localhost)
- `POSTGRES_PORT`: PostgreSQL server port (default: 5432)

## Docker Images

Available tags:
- `latest`, `ubuntu-latest`: Built on Ubuntu base image
- `alpine-latest`: Built on Alpine Linux base image

## Logging

The proxy logs all SQL queries (SELECT, INSERT, UPDATE, DELETE) with the following information:
- Timestamp
- Client IP and port
- Full SQL query

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.