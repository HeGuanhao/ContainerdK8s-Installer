#!/bin/bash

set -e

yum install -y haproxy --downloaddir ./roles/haproxy/ --downloadonly

yum install -y ./roles/haproxy/*.rpm