use Test::Tester;
use Test::More tests => 224;
use Test::Output;

use strict;
use warnings;

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/ERR/i,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      undef,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/ERR/i,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      'OUT',
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDOUT bad regex'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      },
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub STDERR bad regex'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR";
                      },
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\nmatches:\n(?i-xsm:ERR)\nnot expected\n",
            },'sub STDERR matching failure'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?i-xsm:out)\nnot expected\n",
            },'sub STDOUT matching failure'
          );

check_test( sub {
            output_unlike(sub {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      },
                      qr/OUT/,
                      qr/ERR/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\nSTDERR:\nTEST ERR\nmatches:\n(?-xism:ERR)\nnot expected\n",
            },'sub STDERR matching failure'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/ERR/i,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      undef,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/ERR/i,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      'OUT',
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDOUT bad regex'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT\n";
                        print STDERR "TEST ERR\n";
                      }
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block STDERR bad regex'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\nmatches:\n(?i-xsm:ERR)\nnot expected\n",
            },'block STDERR matching failure'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?i-xsm:out)\nnot expected\n",
            },'block STDOUT matching failure'
          );

check_test( sub {
            output_unlike {
                        print "TEST OUT";
                        print STDERR "TEST ERR";
                      }
                      qr/OUT/,
                      qr/ERR/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\nSTDERR:\nTEST ERR\nmatches:\n(?-xism:ERR)\nnot expected\n",
            },'block STDERR matching failure'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/ERR/i,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      undef,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/ERR/i,
                      undef,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'sub system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      'OUT',
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub system STDOUT bad regex'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'sub system STDERR bad regex'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\nmatches:\n(?i-xsm:ERR)\nnot expected\n",
            },'sub system STDERR matching failure'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?i-xsm:out)\nnot expected\n",
            },'sub system STDOUT matching failure'
          );

check_test( sub {
            output_unlike(sub {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      },
                      qr/OUT/,
                      qr/ERR/,
                      'Testing STDOUT and STDERR match'
                    )
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\nSTDERR:\nTEST ERR\nmatches:\n(?-xism:ERR)\nnot expected\n",
            },'sub system STDERR matching failure'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/ERR/i,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      undef,
                      qr/OUT/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/ERR/i,
                      undef,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 1,
              name => 'Testing STDOUT and STDERR match',
              diag => '',
            },'block system STDOUT and STDOUT not matching success'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      'OUT',
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDOUT',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block system STDOUT bad regex'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/OUT/i,
                      'OUT',
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              depth => 2,
              name => 'output_unlike_STDERR',
              diag => "'OUT' doesn't look much like a regex to me.\n",
            },'block system STDERR bad regex'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/out/,
                      qr/ERR/i,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDERR:\nTEST ERR\nmatches:\n(?i-xsm:ERR)\nnot expected\n",
            },'block system STDERR matching failure'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/out/i,
                      qr/err/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?i-xsm:out)\nnot expected\n",
            },'block system STDOUT matching failure'
          );

check_test( sub {
            output_unlike {
                        system("perl", "-e", "print qq(TEST OUT)");
                        system("perl", "-e", "print STDERR qq(TEST ERR)");
                      }
                      qr/OUT/,
                      qr/ERR/,
                      'Testing STDOUT and STDERR match'
            },{
              ok => 0,
              name => 'Testing STDOUT and STDERR match',
              diag => "STDOUT:\nTEST OUT\nmatches:\n(?-xism:OUT)\nnot expected\nSTDERR:\nTEST ERR\nmatches:\n(?-xism:ERR)\nnot expected\n",
            },'block system STDERR matching failure'
          );
