#########################ubuntu0#######################################
base:
  ubuntu0:
    - network
    - firewall.main
    - diagnostic.connectivity_test
    - diagnostic.network_diagnostic
    - diagnostic.arp_neigh_diag
    - diagnostic.host_reachability_test
    - services.network_services_status
    - services.network_services_fix
    - services.dhcp_server
    - services.ntp_client
    - prereqs.network_tools
    - network.ip_static_netplan0
    - diagnostic.ip_report.sls
    - services.datetime_report
    - annihilatio

######################ubuntu1####################################
  ubuntu1:
    - network
    - firewall.main
    - diagnostic.connectivity_test
    - diagnostic.network_diagnostic
    - diagnostic.arp_neigh_diag
    - diagnostic.host_reachability_test
    - services.network_services_status
    - services.network_services_fix
    - services.dhcp_server
    - services.ntp_client
    - prereqs.network_tools
    - network.ip_static_netplan1
    - diagnostic.ip_report.sls
    - services.datetime_report
    - annihilatio

######################ubuntu2####################################
  ubuntu2:
    - network
    - firewall.main
    - diagnostic.connectivity_test
    - diagnostic.network_diagnostic
    - diagnostic.arp_neigh_diag
    - diagnostic.host_reachability_test
    - services.network_services_status
    - services.network_services_fix
    - services.dhcp_server
    - services.ntp_client
    - prereqs.network_tools
    - network.ip_static_netplan2
    - diagnostic.ip_report.sls
    - services.datetime_report
    - annihilatio
#######################router_.20####################################
  router_.20:
    - router.router_.20_config
    - router.secure_filter
    - router.backup
    - router.restore
    - router.monitoring
	
#######################router_.30###############################
  router_.30:
    - router.router_.30_config
    - router.secure_filter
    - router.backup
    - router.restore
    - router.monitoring
