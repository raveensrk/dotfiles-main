#! /bin/sh
# This file generated by maintain/regenerate_cmd_tests.sh

if test z"$srcdir" = "z"; then
  srcdir=.
fi

one_test_logs_dir=test_log


dir=formatting
name='texi_ignore_and_comments'
mkdir -p $dir

"$srcdir"/run_parser_all.sh -dir $dir $name
exit_status=$?
cat $dir/$one_test_logs_dir/$name.log
exit $exit_status

