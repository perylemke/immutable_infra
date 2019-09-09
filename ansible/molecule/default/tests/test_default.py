import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_apt_transport_https_is_installed(host):
    apt_transport_https = host.package("apt-transport-https")
    assert apt_transport_https.is_installed


def test_ca_certificates_is_installed(host):
    ca_certificates = host.package("ca-certificates")
    assert ca_certificates.is_installed


def test_curl_is_installed(host):
    curl = host.package("curl")
    assert curl.is_installed


def test_gnupg2_is_installed(host):
    gnupg2 = host.package("gnupg2")
    assert gnupg2.is_installed


def test_locales_is_installed(host):
    locales = host.package("locales")
    assert locales.is_installed


def test_openssh_server_is_installed(host):
    openssh_server = host.package("openssh-server")
    assert openssh_server.is_installed


def test_software_properties_common_is_installed(host):
    software_properties_common = host.package("software-properties-common")
    assert software_properties_common.is_installed


def test_python_docker_is_installed(host):
    python_docker = host.package("python-docker")
    assert python_docker.is_installed


def test_python_pip_is_installed(host):
    python_pip = host.package("python-pip")
    assert python_pip.is_installed


def test_python3_pip_is_installed(host):
    python3_pip = host.package("python3-pip")
    assert python3_pip.is_installed


def test_ipv4_is_zero(host):
    net = host.sysctl("net.ipv4.ip_forward")

    assert net == 1


def test_docker_is_running_and_enabled(host):
    docker = host.service("docker")

    assert docker.is_running
    assert docker.is_enabled


def test_apery_is_running(host):
    apery = host.docker("apery")

    assert apery.is_running
