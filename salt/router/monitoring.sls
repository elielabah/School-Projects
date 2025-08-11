# Surveillance et diagnostic sur VyOS
vyos_diagnostic:
  cmd.run:
    - name: |
        echo "=== ÉTAT DES INTERFACES ==="
        run show interfaces

        echo "=== TABLE DE ROUTAGE ==="
        run show ip route

        echo "=== PING GOOGLE ==="
        run ping 8.8.8.8 count 4
