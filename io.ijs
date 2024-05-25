#!/usr/bin/env ijconsole
chomp =: (}.~ _1 * LF = {:) :. (LF ,~ ])
unit =: ''
empty *: &. (". @: chomp @: stdin) unit
exit 0
