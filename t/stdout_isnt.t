use Test::Tester;
use Test::More tests => 84;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stdout_isnt(sub {
                        print "TEST OUT\n";
                      },
                      "TEST OUT STDOUT\n",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT not equal success'
          );

check_test( sub {
            stdout_isnt(sub {
                        printf("TEST OUT - %d\n",42);
                      },
                      "TEST OUT - 25\n",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub STDOUT printf not equal success'
          );

check_test( sub {
            stdout_isnt(sub {
                        print "TEST OUT";
                      },
                      "TEST OUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub STDOUT matches failure'
          );

check_test( sub {
            stdout_isnt {
                        print "TEST OUT\n";
                      }
                      "TEST OUT STDOUT\n",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT not equal success'
          );

check_test( sub {
            stdout_isnt {
                        printf("TEST OUT - %d\n",42);
                      }
                      "TEST OUT - 25\n",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block STDOUT printf not equal success'
          );

check_test( sub {
            stdout_isnt {
                        print "TEST OUT";
                      }
                      "TEST OUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block STDOUT matches failure'
          );

check_test( sub {
            stdout_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT STDOUT\n",
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT not equal success'
          );

check_test( sub {
            stdout_isnt(sub {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 42");
                      },
                      "TEST OUT - 25\n",
                      'Testing STDOUT printf'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'sub system STDOUT printf not equal success'
          );

check_test( sub {
            stdout_isnt(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      "TEST OUT",
                      'Testing STDOUT failure'
                    )
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'sub system STDOUT matches failure'
          );

check_test( sub {
            stdout_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT STDOUT\n",
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT not equal success'
          );

check_test( sub {
            stdout_isnt {
                        system("perl", "-e", "printf qq(TEST OUT - %d), 42");
                      }
                      "TEST OUT - 25\n",
                      'Testing STDOUT printf'
            },{
              ok => 1,
              name => 'Testing STDOUT printf',
              diag => '',
            },'block system STDOUT printf not equal success'
          );

check_test( sub {
            stdout_isnt {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      "TEST OUT",
                      'Testing STDOUT failure'
            }, {
              ok => 0,
              name => 'Testing STDOUT failure',
              diag => "STDOUT:\nTEST OUT\nmatching:\nTEST OUT\nnot expected\n",
            },'block system STDOUT matches failure'
          );
