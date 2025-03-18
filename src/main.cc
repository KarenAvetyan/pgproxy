#include "pgproxy.h"

int main(int argc, char* argv[]) {
  if (argc != 4) {
    std::cerr << "Usage: " << argv[0]
              << " <proxy_port> <backend_host> <backend_port>" << std::endl;
    return 1;
  }

  ProxyServer my_server(argv[1], argv[2], argv[3]);
  my_server.StartServer();

  return 0;
}
