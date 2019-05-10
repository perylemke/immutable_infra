import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_docker_is_running(host):
    service = host.service('docker')

    assert service.is_running
    assert service.is_enabled


def test_apery_running_and_enabled(host):
    service = host.service('apery')

    assert service.is_running
    assert service.is_enabled
