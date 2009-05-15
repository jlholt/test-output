use Test::Tester;
use Test::More tests => 56;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stderr_isnt(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST OUT STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR not equal success'
          );

check_test( sub {
            stderr_isnt(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\nTEST OUT\nnot expected\n",
            },'sub STDERR matches failure'
          );

check_test( sub {
            stderr_isnt {
                        print STDERR "TEST OUT\n";
                      }
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR not equal success'
          );

check_test( sub {
            stderr_isnt {
                        print STDERR "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\nTEST OUT\nnot expected\n",
            },'block STDERR matches failure'
          );

check_test( sub {
            stderr_isnt(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      "TEST OUT STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR not equal success'
          );

check_test( sub {
            stderr_isnt(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\nTEST OUT\nnot expected\n",
            },'sub system STDERR matches failure'
          );

check_test( sub {
            stderr_isnt {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST OUT STDERR\n",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR not equal success'
          );

check_test( sub {
            stderr_isnt {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\nTEST OUT\nnot expected\n",
            },'block system STDERR matches failure'
          );
