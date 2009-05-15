use Test::Tester;
use Test::More tests => 7;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stdout_is(sub {
                        binmode STDOUT;
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      'bug 45748'
                    )
            },{
              ok => 1,
              name => 'bug 45748',
              diag => '',
            },'sub bug 45748 matches'
          );
