#!/usr/bin/env bash
ls -lt /tmp | rg 'tmp.' | awk '{ print $7,$6,$8,$9}'
