#########################ubuntu0#######################################
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
    - services.ntp_client
    - prereqs.network_tools

######################ubuntu1####################################
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
    - services.ntp_client
    - prereqs.network_tools

######################ubuntu2####################################
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
    - services.ntp_client
    - prereqs.network_tools
