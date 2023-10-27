#!/bin/bash

set -e

yum install -y keepalived --downloaddir ./roles/keepalived/ --downloadonly

yum install -y ./roles/keepalived/*.rpm