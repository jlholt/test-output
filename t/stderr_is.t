use Test::Tester;
use Test::More tests => 56;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stderr_is(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR matching success'
          );

check_test( sub {
            stderr_is(sub {
                        print STDERR "TEST OUT";
                      },
                      "TEST OUT STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            stderr_is {
                        print STDERR "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR matching success'
          );

check_test( sub {
            stderr_is {
                        print STDERR "TEST OUT";
                      }
                      "TEST OUT STDERR",
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            stderr_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR matching success'
          );

check_test( sub {
            stderr_is(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      "TEST OUT STDERR",
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'sub system STDERR not matching failure'
          );

check_test( sub {
            stderr_is {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR matching success'
          );

check_test( sub {
            stderr_is {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      "TEST OUT STDERR",
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR is:\nTEST OUT\nnot:\nTEST OUT STDERR\nas expected\n",
            },'block system STDERR not matching failure'
          );

