use Test::Tester;
use Test::More tests => 98;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            combined_like(sub {
                        print "TEST OUT\n";
                      },
                      qr/OUT/i,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub STDOUT matching success'
          );

check_test( sub {
            combined_like(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/ERR/i,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub STDERR matching success'
          );

check_test( sub {
            combined_like(sub {
                        print "TEST OUT\n";
                      },
                      'OUT',
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'combined_like',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub bad regex'
          );

check_test( sub {
            combined_like(sub {
                        print "TEST OUT";
                      },
                      qr/out/,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\ndon't match:\n(?-xism:out)\nas expected\n",
            },'sub STDOUT not matching failure'
          );

check_test( sub {
            combined_like {
                        print "TEST OUT\n";
                      }
                      qr/OUT/i,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block STDOUT matching success'
          );

check_test( sub {
            combined_like {
                        print "TEST OUT\n";
                      }
                      'OUT',
                      'Testing STDOUT'
            },{
              ok => 0,
              depth => 2,
              name => 'combined_like',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block bad regex'
          );

check_test( sub {
            combined_like {
                        print "TEST OUT";
                      }
                      qr/out/,
                      'Testing STDOUT'
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\ndon't match:\n(?-xism:out)\nas expected\n",
            },'block STDOUT not matching failure'
          );

check_test( sub {
            combined_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      qr/OUT/i,
                      'Testing STDOUT'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'sub system STDOUT matching success'
          );

check_test( sub {
            combined_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/ERR/i,
                      'Testing STDERR'
                    )
            },{
              ok => 1,
              name => 'Testing STDERR',
              diag => '',
            },'sub system STDERR matching success'
          );

check_test( sub {
            combined_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      'OUT',
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'combined_like',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub system bad regex'
          );

check_test( sub {
            combined_like(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                      },
                      qr/out/,
                      'Testing STDOUT'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\ndon't match:\n(?-xism:out)\nas expected\n",
            },'sub system STDOUT not matching failure'
          );

check_test( sub {
            combined_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      qr/OUT/i,
                      'Testing STDOUT'
            },{
              ok => 1,
              name => 'Testing STDOUT',
              diag => '',
            },'block system STDOUT matching success'
          );

check_test( sub {
            combined_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      'OUT',
                      'Testing STDOUT'
            },{
              ok => 0,
              depth => 2,
              name => 'combined_like',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block system bad regex'
          );

check_test( sub {
            combined_like {
                        system("perl", "-e", "print qq(TEST OUT)");
                      }
                      qr/out/,
                      'Testing STDOUT'
            },{
              ok => 0,
              name => 'Testing STDOUT',
              diag => "STDOUT & STDERR:\nTEST OUT\ndon't match:\n(?-xism:out)\nas expected\n",
            },'block system STDOUT not matching failure'
          );
