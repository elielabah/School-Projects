base:
  ubuntu0:
    - webserver
    - network
    - firewall
    - diagnostic.connectivity_test
    - diagnostic.network_diagnostic
    - diagnostic.arp_neigh_diag
    - diagnostic.host_reachability_test
    - services.network_services_status
    - services.network_services_fix
    - network.dhcp_server.sls
    - services.dhcp_server
  ubuntu1:
    - webserver
    - network
    - firewall
    - diagnostic.connectivity_test
    - diagnostic.network_diagnostic
    - diagnostic.arp_neigh_diag
    - diagnostic.host_reachability_test
    - services.network_services_status
    - services.network_services_fix
    - network.dhcp_server.sls
    - services.dhcp_server
