#!/bin/bash

df -h $HOME | awk '{print $5}' | tail -n 1