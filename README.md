# scale-ci-azure
Playbooks/tasks to setup scale-ci tests on OpenShift Azure

1. Build cluster for OSA using [openshift-azure](https://github.com/openshift/openshift-azure/)
```
[user@fedora openshift-azure]$ cp env.example env
[user@fedora openshift-azure]$ vi env
[user@fedora openshift-azure]$ . ./env
[user@fedora openshift-azure]$ time ./hack/create.sh perf-test
```
2. Configure this repo
```
[user@fedora scale-ci-azure]$ cp vars/install.yml vars/install.local.yml
[user@fedora scale-ci-azure]$ vi vars/install.local.yml
```
A copy is made of the `vars/install.yml` with the name `vars/install.local.yml` such that private information can be changed to install vars without pushing into git.

3. Create inventory file:
```
[user@fedora scale-ci-azure]$ time ansible-playbook -i 'localhost,' inventory.yml -e 'rg=perf-test'
```
4. Install tooling:
```
[user@fedora scale-ci-azure]$ time ansible-playbook --forks 20 -i inventory install.yml
```
