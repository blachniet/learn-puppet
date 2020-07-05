# Learn Puppet

This setup is helping me learn more about Puppet. I learn by doing, and this is me doing Puppet.

## Quickstart

1. Start the master and node.

    ```sh
    cd puppetmaster
    vagrant up
    cd ../puppetnode
    vagrant up
    ```

1. Sign the puppetnode certificate. Pay attention to where we are running each of these commands (master vs node).

    ```sh
    # Submit a certificate signing request on the node.
    [vagrant@puppetnode] sudo /opt/puppetlabs/bin/puppet agent --verbose --no-daemonize --onetime

    # Sign the cert on the master.
    [vagrant@puppetmaster] sudo /opt/puppetlabs/bin/puppetserver ca sign --certname puppetnode.localdomain

    # Confirm a successful connection on the node.
    [vagrant@puppetnode] sudo /opt/puppetlabs/bin/puppet agent --verbose --no-daemonize --onetime

## Reference

- [Puppet Installation Docs]
- [Regenerate certs on master][2]
- [`ip Command Cheat Sheet`]
- [FirewallD Tutorial from DigitalOcean][3]
- Important Puppet configuration options:
  - [`environment_timeout`]
  - [`dns_alt_names`]

[Puppet Installation Docs]: https://puppet.com/docs/puppetserver/latest/install_from_packages.html#install-puppet-server-from-packages
[`ip Command Cheat Sheet`]: https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
[2]: https://puppet.com/docs/puppet/latest/ssl_regenerate_certificates.html
[3]: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7
[`environment_timeout`]: environment_timeout
[`dns_alt_names`]: https://puppet.com/docs/puppet/latest/config_important_settings.html#basics
