use Test::Tester;
use Test::More tests => 84;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            stderr_unlike(sub {
                        print STDERR "TEST OUT\n";
                      },
                      qr/out/,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR matching success'
          );

check_test( sub {
            stderr_unlike(sub {
                        print STDERR "TEST OUT\n";
                      },
                      'OUT',
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'stderr_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDERR matching success'
          );

check_test( sub {
            stderr_unlike(sub {
                        print STDERR "TEST OUT";
                      },
                      qr/OUT/,
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\n",
            },'sub STDERR not matching failure'
          );

check_test( sub {
            stderr_unlike {
                        print STDERR "TEST OUT\n";
                      }
                      qr/out/,
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block STDERR matching success'
          );

check_test( sub {
            stderr_unlike {
                        print STDERR "TEST OUT\n";
                      }
                      'OUT',
                      'Testing STDERR'
            },{
              ok => 0,
              depth => 2,
              name => 'stderr_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDERR matching success'
          );

check_test( sub {
            stderr_unlike {
                        print STDERR "TEST OUT";
                      }
                      qr/OUT/,
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\n",
            },'block STDERR not matching failure'
          );

check_test( sub {
            stderr_unlike(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      qr/out/,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR matching success'
          );

check_test( sub {
            stderr_unlike(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      'OUT',
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'stderr_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub system STDERR matching success'
          );

check_test( sub {
            stderr_unlike(sub {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      },
                      qr/OUT/,
                      'Testing STDERR'
                    )
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\n",
            },'sub system STDERR not matching failure'
          );

check_test( sub {
            stderr_unlike {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      qr/out/,
                      'Testing STDERR'
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'block system STDERR matching success'
          );

check_test( sub {
            stderr_unlike {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      'OUT',
                      'Testing STDERR'
            },{
              ok => 0,
              depth => 2,
              name => 'stderr_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block system STDERR matching success'
          );

check_test( sub {
            stderr_unlike {
                        system("perl", "-e", "print STDERR qq(TEST OUT)");
                      }
                      qr/OUT/,
                      'Testing STDERR'
            },{
              ok => 0,
              name => 'Testing STDERR',
              diag => "STDERR:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\n",
            },'block system STDERR not matching failure'
          );

