use Test::Tester;
use Test::More tests => 98;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            combined_unlike(sub {
                        print "TEST OUT\n";
                      },
                      qr/out/,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT not matching success'
          );

check_test( sub {
            combined_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/err/,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR not matching success'
          );

check_test( sub {
            combined_unlike(sub {
                        print "TEST OUT\n";
                      },
                      'OUT',
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'combined_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub bad regex'
          );

check_test( sub {
            combined_unlike(sub {
                        print "TEST OUT";
                      },
                      qr/OUT/,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\n(?-xism:OUT)\nnot expected\n",
            },'sub STDOUT matching failure'
          );

check_test( sub {
            combined_unlike {
                        print "TEST OUT\n";
                      }
                      qr/out/,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT not matching success'
          );

check_test( sub {
            combined_unlike {
                        print "TEST OUT\n";
                      }
                      'OUT',
                      'Testing STDOUT'
            },{
              ok => 0,
              depth => 2,
              name => 'combined_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block bad regex'
          );

check_test( sub {
            combined_unlike {
                        print "TEST OUT";
                      }
                      qr/OUT/,
                      'Testing STDOUT'
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\n(?-xism:OUT)\nnot expected\n",
            },'block STDOUT matching failure'
          );

check_test( sub {
            combined_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      qr/out/,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT not matching success'
          );

check_test( sub {
            combined_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/err/,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR not matching success'
          );

check_test( sub {
            combined_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      'OUT',
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'combined_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub system bad regex'
          );

check_test( sub {
            combined_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      qr/OUT/,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\n(?-xism:OUT)\nnot expected\n",
            },'sub system STDOUT matching failure'
          );

check_test( sub {
            combined_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      qr/out/,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT not matching success'
          );

check_test( sub {
            combined_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      'OUT',
                      'Testing STDOUT'
            },{
              ok => 0,
              depth => 2,
              name => 'combined_unlike',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block system bad regex'
          );

check_test( sub {
            combined_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      qr/OUT/,
                      'Testing STDOUT'
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\nmatching:\n(?-xism:OUT)\nnot expected\n",
            },'block system STDOUT matching failure'
          );

