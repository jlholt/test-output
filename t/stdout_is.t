use Test::Tester;
use Test::More tests => 84;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stdout_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT matches success'
          );

check_test( sub {
            stdout_is(sub {
                        printf("TEST OUT - %d",42);
                      },
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf matches success'
          );

check_test( sub {
            stdout_is(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            stdout_is {
                        print "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT matches success'
          );

check_test( sub {
            stdout_is {
                        printf("TEST OUT - %d",42);
                      }
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf matches success'
          );

check_test( sub {
            stdout_is {
                        print "TEST OUT";
                      }
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            stdout_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT matches success'
          );

check_test( sub {
            stdout_is(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 42");
                      },
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf matches success'
          );

check_test( sub {
            stdout_is(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'sub system STDOUT not matching failure'
          );

check_test( sub {
            stdout_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT matches success'
          );

check_test( sub {
            stdout_is {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 42");
                      }
                      "TEST OUT - 42",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf matches success'
          );

check_test( sub {
            stdout_is {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT STDOUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT is:\nTEST OUT\nnot:\nTEST OUT STDOUT\nas expected\n",
            },'block system STDOUT not matching failure'
          );
