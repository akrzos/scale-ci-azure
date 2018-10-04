#/usr/bin/env bash
source /opt/pbench-agent/profile

pbench-register-tool-set
pbench-register-tool-set --remote=master-000001
pbench-register-tool-set --remote=master-000002
pbench-register-tool-set --remote=infra-000000
pbench-register-tool-set --remote=infra-000001
pbench-register-tool-set --remote=compute-000000
pbench-register-tool-set --remote=compute-000001
