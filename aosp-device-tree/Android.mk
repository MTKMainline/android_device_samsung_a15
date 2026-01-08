#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a15)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
# the tree owner is lyntaxqq. known as meeo11 or lyntax_